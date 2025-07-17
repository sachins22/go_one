import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class TransactionSussecPages extends StatelessWidget {
  const TransactionSussecPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppPallete.backgroundColor ,
      body: Center(
        child: SvgPicture.asset(
          AllImages.successScreen,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}