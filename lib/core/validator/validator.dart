import 'package:get_storage/get_storage.dart';

class AppValidator {
  // Validate email
  static String? validateEmptyField(String? fieldName, value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    if (fieldName == "Name" && value.toString().length < 3) {
      return "$fieldName length must be greater than 3";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  // Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 8 characters long";
    }
    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'\d').hasMatch(value);
    final hasSpecialCharacter =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasUpperCase) {
      return "Password must contain at least one uppercase letter";
    }
    if (!hasLowerCase) {
      return "Password must contain at least one lowercase letter";
    }
    if (!hasDigit) {
      return "Password must contain at least one digit";
    }
    if (!hasSpecialCharacter) {
      return "Password must contain at least one special character";
    }

    return null;
  }

  // // Validate Indian phone number
  // static String? validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Phone number is required";
  //   }
  //   final phoneRegex = RegExp(r'^[6-9]\d{9}$');
  //   if (!phoneRegex.hasMatch(value)) {
  //     return "Please enter a valid 10-digit Indian phone number";
  //   }
  //   return null;
  // }

  // static String? validateOTP(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'OTP is required';
  //   }
  //   if (value.length < 6) {
  //     return 'Enter full 6 digit otp';
  //   }
  //   return null;
  // }
}