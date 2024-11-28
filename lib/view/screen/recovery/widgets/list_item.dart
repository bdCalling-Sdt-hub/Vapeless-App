import 'package:flutter/material.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import '../../../../utils/app_colors.dart';
import '../../../component/text/common_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
          color: AppColors.bg4,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 0.5)),
      child: Row(
        children: [
          CommonImage(
            imageSrc: item['image'],
            width: 40,
            height: 40,
          ),
          10.width,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: item['title'],
                  bottom: 4,
                ),
                CommonText(
                  text: item['subtitle'],
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  bottom: 4,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          CircularPercentageIndicator(
            percentage: 0.37, // 37% as a decimal value
            size: 50,
            strokeWidth: 4,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class CircularPercentageIndicator extends StatelessWidget {
  final double percentage;
  final double size;
  final double strokeWidth;
  final Color color;

  CircularPercentageIndicator({super.key,
    required this.percentage,
    required this.size,
    required this.strokeWidth,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: strokeWidth,
                backgroundColor: Colors.grey[300],
                color: color,
              ),
            ),
          ),
          Center(
            child: Text(
              '${(percentage * 100).toInt()}%',
              style: TextStyle(
                fontSize: size * 0.2,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
