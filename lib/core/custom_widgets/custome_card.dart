import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class CustomCard extends StatelessWidget {
  final double widthCard;
  final double heightCard;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  CustomCard({
    super.key,
    required this.widthCard,
    required this.heightCard,
    required this.title,
    required this.subtitle,
    required this.onPressed ,
  });

  @override
  Widget build(BuildContext context) {
    // Truncate subtitle if longer than 25 characters
    String displaySubtitle = subtitle.length > 30
        ? subtitle.substring(0, 30) + '..'
        : subtitle;

    return Container(
      width: widthCard,
      height: heightCard,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: AppColors.grey, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                displaySubtitle,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: AppColors.black),
            onPressed: onPressed
          ),
        ],
      ),
    );
  }
}
