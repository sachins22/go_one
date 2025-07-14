import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/auth/login.dart';
import 'package:go_one_app/views/onboarding.dart/onboardsec.dart';

class OnboardingScreenfirst extends StatelessWidget {
  const OnboardingScreenfirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Top Row: Logo and Skip
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AllImages.logo, height: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPages()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: AppPallete.greyColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Main Image
                Image.asset(AllImages.ob1, height: 250),
                const SizedBox(height: 16),

                // Home District Logo
                Image.asset(AllImages.ob2, height: 150),
                const SizedBox(height: 24),

                // Page Indicator
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 15,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 15,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Text Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey! 😊",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          // Outline / Stroke
                          Text(
                            "Welcome in GoOne",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = AppColors.black,
                            ),
                          ),
                          // Fill
                          Text(
                            "Welcome in GoOne",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppPallete.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(
                      "Let's start quickly. It’s very easy to get started. We’ll be here to help and guide you on your journey with us as a Distribution Partner.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Elevated Button
                AppElevatedButton(
                  buttonHeight: 50,
                  buttonWidth: 200,
                  text: "Next",
                  onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreenSec()));
                  },
                  backgroundColor: AppColors.elveatedbackgroundColor,
                  textColor: AppPallete.whiteColor,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
