import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:vapeless/utils/app_utils.dart';
import 'package:http/http.dart' as http;

import '../../utils/payment_key.dart';

class PaymentController extends GetxController {
  TextEditingController amountController = TextEditingController();

  static PaymentController get instance => Get.put(PaymentController());

  paymentPaypal() {
    return PaypalCheckoutView(
      sandboxMode: true,
      clientId: clientId,
      secretKey: secretKey,
      transactions: const [
        {
          "amount": {
            "total": "100",
            "currency": "USD",
            "details": {
              "subtotal": "100",
              "shipping": '0',
              "shipping_discount": '0'
            }
          },
          "description": "The payment transaction description.",
          "item_list": {
            "items": [
              {
                "name": "Apple",
                "quantity": 1,
                "price": "100",
                "currency": "USD"
              },
            ],
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        Utils.snackBarMessage("Payment successful", "");
        Navigator.pop(Get.context!);
        if (kDebugMode) {
          print("onSuccess: $params");
        }
      },
      onError: (error) {
        Navigator.pop(Get.context!);
        Get.snackbar("Something went wrong,", "Try again!");
        if (kDebugMode) {
          print("onError: $error");
        }
      },
      onCancel: () {
        Navigator.pop(Get.context!);
        Get.snackbar("Payment cancelled", "");
        if (kDebugMode) {
          print('cancelled:');
        }
      },
    );
  }

  /// stripe payment

  Map<String, dynamic>? paymentIntentData;

  Future<PaymentIntent> stripeCheckPaymentIntentTransaction(String piId) async {
    try {
      Stripe.publishableKey = stripePublishableKey;

      final paymentIntent = await Stripe.instance.retrievePaymentIntent(piId);

      if (kDebugMode) {
        print(
            "===========================================> paymentIntent $paymentIntent");
      }
      return paymentIntent;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching payment intent: $e');
      }
      throw e;
    }
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent("6", "USD");
      if (paymentIntentData != null) {
        await Stripe.instance
            .initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
          billingDetails: const BillingDetails(
              name: 'Naimul Hassan',
              email: 'developernaimul00@gmail.com',
              address: Address(
                  city: 'Dhaka',
                  country: 'Bangladesh',
                  line1: 'Dhaka',
                  line2: 'Dhaka',
                  postalCode: '1121',
                  state: 'Dhaka')),
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          merchantDisplayName: 'Naimul Hassan',
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          style: ThemeMode.dark,
        ))
            .then((value) {
          if (kDebugMode) {
            print('Is completed payment properly????????????????');
          }
        });
        displayPaymentSheet();
        if (kDebugMode) {
          print("----------display payment sheet didn't called");
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(
            '-=-=-=-=-=-=-=---=-=-=-exception: $e $s =-=-=-=-=--=-=-=-=-=-=-=');
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      if (kDebugMode) {
        print(
            "=============>>>${response.body}----${response.statusCode}<<<==================");
      }

      return jsonDecode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print("Error Occurred:======================> ${e.toString()}");
      }
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      // stripeCheckPaymentIntentTransaction(paymentIntentData!['client_secret']);
      retrieveTxnId(paymentIntent: paymentIntentData!['id']);
      if (kDebugMode) {
        print('payment intent$paymentIntentData');
      }
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(const SnackBar(content: Text("paid successfully")));

      paymentIntentData = null;
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }

  retrieveTxnId({required String paymentIntent}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.stripe.com/v1/charges?payment_intent=$paymentIntent'),
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded"
          });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(
            "========================================================> data $data");
        print("Transaction Id ${data['data'][0]['balance_transaction']}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
