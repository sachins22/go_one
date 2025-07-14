import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';


class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}