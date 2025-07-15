import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/core/validator/validator.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lightContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.darkerGrey, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.person_outline, size: 20, color: AppColors.darkerGrey),
          const SizedBox(width: 9),
          Container(width: 1, height: 20, color: AppColors.darkerGrey),
          const SizedBox(width: 9),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: AppValidator.validateEmail,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: AppColors.darkerGrey),
                border: InputBorder.none,
                isCollapsed: true,
              ),
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
