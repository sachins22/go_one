import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/onboarding.dart/onboardfirst.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreenfirst(),
      );
    } else {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreenfirst(),
      );
    }
  }
}
