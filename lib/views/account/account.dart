import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/account/widgets/earning.dart';
import 'package:go_one_app/views/account/widgets/language_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/locality_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/notification_screen.dart';
import 'package:go_one_app/views/account/widgets/rating.dart';
import 'package:go_one_app/views/notification/notification_main.dart';
import '../../core/custom_widgets/custome_card.dart';

class AccountPages extends StatefulWidget {
  const AccountPages({super.key});

  @override
  State<AccountPages> createState() => _AccountPagesState();
}

class _AccountPagesState extends State<AccountPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.loginPageTopColor,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(AllImages.logo, height: 40),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationMainScreen(),
                  ),
                );
              },
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: AppColors.whiteColor,
                    size: 28,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.buttonPrimary,
                      child: const Text(
                        "2",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     body: SingleChildScrollView(
      child: Column(
        children: [
          _buildTopHeader(context),
          const SizedBox(height: 20),

          // 👇 Earnings Card ko yahan shift kiya gaya hai
          _buildEarningsCard(context),
          const SizedBox(height: 20),

          CustomCard(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingScreen()),
              );
            },
            widthCard: MediaQuery.of(context).size.width * 0.9,
            heightCard: 100,
            title: "Ratings",
            subtitle: "Check customer remarks and ratings received",
          ),
          const SizedBox(height: 20),
          CustomCard(
            onPressed: () {},
            widthCard: MediaQuery.of(context).size.width * 0.9,
            heightCard: 100,
            title: "Payout Terms",
            subtitle:
                "Check how you could earn and payment credits in your account.",
          ),
          const SizedBox(height: 20),
          CustomCard(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LanguageSelectionScreen()),
              );
            },
            widthCard: MediaQuery.of(context).size.width * 0.9,
            heightCard: 100,
            title: "Language",
            subtitle: "English (United States)",
          ),
          const SizedBox(height: 20),
          CustomCard(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationScreen()),
              );
            },
            widthCard: MediaQuery.of(context).size.width * 0.9,
            heightCard: 100,
            title: "Notifications Area",
            subtitle: "Appreciations & other notifications if applicable",
          ),
          const SizedBox(height: 20),
          CustomCard(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LocalitySelectionScreen()),
              );
            },
            widthCard: MediaQuery.of(context).size.width * 0.9,
            heightCard: 100,
            title: "Localities",
            subtitle: "Select your desired localities in your area.",
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

Widget _buildTopHeader(BuildContext context) {
  return Container(
    height: 130,
    decoration: const BoxDecoration(
      color: AppColors.loginPageTopColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AllImages.user),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.email, color: AppColors.whiteColor, size: 16),
                    SizedBox(width: 6),
                    Text(
                      "john@gmail.com",
                      style: TextStyle(color: AppColors.whiteColor, fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.phone, color: AppColors.whiteColor, size: 16),
                    SizedBox(width: 6),
                    Text(
                      "+41-12311-10245",
                      style: TextStyle(color: AppColors.whiteColor, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: AppColors.darkblue, size: 20),
              SizedBox(height: 4),
              Text("4.5", style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ],
      ),
    ),
  );
}

  Widget _buildEarningsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color:AppColors.black,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Earnings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.play_circle_fill, color: AppColors.black),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _EarningItem(title: "Total Earnings", value: "Rs. 750"),
                _EarningItem(
                  title: "Tips Earned",
                  value: "Rs. 50",
                  onTap: () {
                    print("✅✅Tapped on Tips Earned");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyEarningsScreen(),
                      ),
                    );
                  },
                ),
                _EarningItem(title: "Orders Served", value: "25"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EarningItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _EarningItem({required this.title, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPallete.transparentColor,
      child: InkWell(
        onTap: onTap, // use the passed callback
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
