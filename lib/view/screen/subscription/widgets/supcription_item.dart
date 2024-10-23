import 'package:flutter/cupertino.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';

Widget subscriptionItem(text) {
  return Container(
    padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16),
    child: Row(
      children: [
        CommonImage(
          imageSrc: AppIcons.right,
          imageType: ImageType.svg,
        ),
        4.width,
        CommonText(text: text, fontSize: 12,)
      ],
    ),
  );
}
