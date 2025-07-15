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
          const Icon(Icons.lock_outline, size: 20, color: AppColors.darkerGrey),
          const SizedBox(width: 9),
          Container(width: 1, height: 20, color: AppColors.darkerGrey),
          const SizedBox(width: 9),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              obscureText: _obscureText,
              validator: AppValidator.validatePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: AppColors.darkerGrey),
                border: InputBorder.none,
                isCollapsed: true,
                 contentPadding:  EdgeInsets.only(top:10), 
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: AppColors.darkerGrey,
                  ),
                  onPressed: _toggleVisibility,
                ),
              ),
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ],
      ),
    );
  }
}
