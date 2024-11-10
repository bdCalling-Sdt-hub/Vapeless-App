class SubscriptionModel {
  final String id;
  final String name;
  final double price;
  final int duration;
  final int maxVapesPerDay;

  SubscriptionModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.maxVapesPerDay,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Basic',
      price: (json['price'] ?? 0).toDouble(),
      duration: json['duration'] ?? 0,
      maxVapesPerDay: json['maxVapesPerDay'] ?? 30,
    );
  }
}
