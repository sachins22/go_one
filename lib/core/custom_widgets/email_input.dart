import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/core/validator/validator.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: AppValidator.validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightContainer,
        hintText: 'Email',
        hintStyle: const TextStyle(color: AppColors.darkerGrey),
        prefixIcon: const Icon(Icons.person_outline, size: 20, color: AppColors.darkerGrey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkerGrey),
        ),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
