import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/core/validator/validator.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInput({super.key, required this.controller});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: AppValidator.validatePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightContainer,
        hintText: 'Password',
        hintStyle: const TextStyle(color: AppColors.darkerGrey),
        prefixIcon: const Icon(Icons.lock_outline, color: AppColors.darkerGrey),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.darkerGrey,
          ),
          onPressed: _toggleVisibility,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
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
