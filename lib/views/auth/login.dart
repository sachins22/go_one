import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/custom_widgets/email_input.dart';
import 'package:go_one_app/core/custom_widgets/password_input.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/bottom_Navigation/bottomNavigation.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Wave with logo
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 180,
                      color: AppColors.loginPageTopColor,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Image.asset(
                      AllImages.logo,
                      height: 40,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "If you are a GoOne distribution partner then this is for you.",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Login",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Please fill in the following form to continue",
                        style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 20),

                      // ✅ Clean Inputs
                      EmailInput(controller: emailController),
                      const SizedBox(height: 20),
                      PasswordInput(controller: passwordController),

                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: AppColors.black, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      AppElevatedButton(
                        backgroundColor: AppColors.elveatedbackgroundColor,
                        textColor: AppColors.textWhite,
                        text: "Proceed",
                        buttonWidth: 300,
                        buttonHeight: 60,
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   // ✅ Form is valid
                          //   debugPrint("Email: ${emailController.text}");
                          //   debugPrint("Password: ${passwordController.text}");
                          //   // Navigate to the next page or perform login action
                          //   Navigator.pushReplacement(context, MaterialPageRoute(
                          //     builder: (context) => const BottomNavigationPages(),
                          //   ));
                          // }
                              Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const BottomNavigationPages(),
                            ));
                        },
                      ),
                      const SizedBox(height: 10),
                      const Center(child: Text("By email for Forgot Password")),
                      const SizedBox(height: 10),

                      AppElevatedButton(
                        backgroundColor: AppColors.darkGrey,
                        textColor: AppColors.textWhite,
                        text: "Proceed via OTP",
                        buttonWidth: 300,
                        buttonHeight: 60,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Clipper for wave background
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);

    // First curve (left hump)
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 40);

    // Second curve (right hump)
    var secondControlPoint = Offset(size.width * 0.75, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
