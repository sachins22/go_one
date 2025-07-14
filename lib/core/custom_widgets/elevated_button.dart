// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:go_one_app/core/theme/app_pallete.dart';

class AppElevatedButton extends StatelessWidget {
  final int? buttonWidth;
  final int? buttonHeight;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppElevatedButton({
    Key? key,
    required this.text,
    required this.buttonWidth,
    required this.buttonHeight,
    this.backgroundColor,
    this.textColor,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth?.toDouble(), 
      height: buttonHeight?.toDouble(), 
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // For pill shape
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
