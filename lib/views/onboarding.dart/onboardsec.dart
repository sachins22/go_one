import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/auth/login.dart';
import 'package:go_one_app/views/onboarding.dart/onboardfirst.dart';

class OnboardingScreenSec extends StatelessWidget {
  const OnboardingScreenSec({super.key});

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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreenfirst()));
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
                Image.asset(AllImages.ob3, height: 250),
                const SizedBox(height: 16),

                // Home District Logo
                Image.asset(AllImages.ob4, height: 150),
                const SizedBox(height: 24),

                // Page Indicator
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 9,
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 30,
                      height: 9,
                      decoration: BoxDecoration(
                        color:AppColors.orangeColor,
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Yes! Your Career is in Good Hands dealing in For Domestic, Commercial, Foods and Ride Services." ,style:  TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),),
                ),
              
                const SizedBox(height: 40),

                // Elevated Button
                AppElevatedButton(
                  buttonHeight: 50,
                  buttonWidth: 200,
                  text: "Next",
                  onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginPages()));
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
