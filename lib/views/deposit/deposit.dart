import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DepositPages extends StatefulWidget {
  const DepositPages({super.key});

  @override
  State<DepositPages> createState() => _DepositPagesState();
}

class _DepositPagesState extends State<DepositPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        title: const Text('Deposit Cash'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cash in Hand",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "₹ 540",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.redColors,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppPallete.greyColor, thickness: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "₹ 210",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.redColors,
                    ),
                  ),
                ],
              ),
            ),
            _buildCard(),
            Divider(color: AppPallete.greyColor, thickness: 1),
            Text(
              "Choose Deposit Option",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildPaybuttons(),
             
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      color: AppColors.whiteColor,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cash limit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "₹ 750",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.redColors,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            LinearPercentIndicator(
              width:
                  MediaQuery.of(context).size.width -
                  64, // full width minus margin/padding
              lineHeight: 10.0,
              percent: 0.73, // 33% filled
              backgroundColor: AppColors.grey,
              progressColor: AppColors.redBackground,
              barRadius: const Radius.circular(20),
            ),
          ],
        ),
      ),
    );
  }
 
 Widget _buildPaybuttons() {
  return InkWell(
    onTap: () {
      // Handle cash deposit action
    },
    child: Container(
      color: AppColors.darkGrey,
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AllImages.GooglePay,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            "UPI",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    ),
  );
}



}
