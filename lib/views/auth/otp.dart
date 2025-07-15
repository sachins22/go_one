import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/bottom_Navigation/bottomNavigation.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

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
                        "OTP Verification",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Enter the OTP sent to your Email",
                        style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 20),

                  

                      // OTP Input
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 60,
                            child: TextFormField(
                              controller: otpControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: const InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (val) {
                                if (val.isNotEmpty && index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 60),

                      AppElevatedButton(
                        backgroundColor: AppColors.elveatedbackgroundColor,
                        textColor: AppColors.textWhite,
                        text: "Verify OTP",
                        buttonWidth: 300,
                        buttonHeight: 50,
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   String otp = otpControllers.map((e) => e.text).join();
                          //   if (otp.length == 4) {
                          //     Navigator.push(context, MaterialPageRoute(
                          //       builder: (context) => const BottomNavigationPages(),
                          //     ));
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(content: Text("Enter full 4-digit OTP")),
                          //     );
                          //   }
                          // }
                           Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const BottomNavigationPages(),
                              ));
                        },
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

// WaveClipper remains the same
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);

    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 40);
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
