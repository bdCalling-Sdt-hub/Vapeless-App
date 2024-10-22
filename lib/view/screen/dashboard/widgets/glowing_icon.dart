import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class GlowingIcon extends StatelessWidget {
  final IconData icon;

  const GlowingIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: AppColors.dropShadow,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.cyan, // Icon color similar to the image
        ),
      ),
    );
  }
}
