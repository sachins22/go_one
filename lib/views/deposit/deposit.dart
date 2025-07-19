import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/deposit/widgets/Transactions_detail.dart';
import 'package:go_one_app/views/deposit/widgets/transaction_success.dart'
    show TransactionSussecPages;
import 'package:go_one_app/views/deposit/widgets/transactions.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: AppPallete.backgroundColor,
        title: const Text(
          'Deposit Cash',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose Deposit Option",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildPaybuttons(
              imagePath: AllImages.GooglePay,
              buttonText: "Pay",
              text: "UPI",
            ),
            const SizedBox(height: 20),
            _buildPaybuttons(
              imagePath: AllImages.debitCard,
              text: "Debit/Credit Card",
              color: AppColors.black,
            ),
            const SizedBox(height: 20),
            _buildPaybuttons(
              imagePath: AllImages.NetBanking,
              text: "Internet Banking",
              color: AppColors.black,
            ),
            const SizedBox(height: 20),
            Divider(color: AppPallete.greyColor, thickness: 1),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: AppColors.redColors,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildContainer(
              "GoOne Wallet",
              "19 January, 2019",
              "₹ 125",
              "Successful",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailScreen(
                      id: "TXN001",
                      amount: "125",
                      type: "GoOne Wallet",
                      status: "Successful",
                      card: "**** **** **** 1234",
                      date: "19 January, 2019",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            _buildContainer(
              "Payout Deduction",
              "20 January, 2019",
              "₹ 1215",
              "Successful",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailScreen(
                      id: "TXN002",
                      amount: "1215",
                      type: "Payout Deduction",
                      status: "Successful",
                      card: "**** **** **** 5678",
                      date: "20 January, 2019",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
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

  Widget _buildPaybuttons({
    required String imagePath,
    String buttonText = '',
    required String text,
    Color? color,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TransactionSussecPages(),
          ),
        );
      },
      child: Container(
        color: AppColors.grey,
        width: double.infinity,
        height: 50,
        // padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(color: color, imagePath, width: 30, height: 30),
                  const SizedBox(width: 10),
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
    String title,
    String subtitle,
    String amount,
    String status,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppColors.darkGrey, fontSize: 13),
                  ),
                ],
              ),
            ),
            // Right Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(color: AppColors.redColors, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
