import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/account/widgets/earning.dart';
import 'package:go_one_app/views/account/widgets/language_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/locality_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/notification_screen.dart';
import 'package:go_one_app/views/account/widgets/rating.dart';
import '../../core/custom_widgets/custome_card.dart';

class AccountPages extends StatelessWidget {
  const AccountPages({super.key});

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
            Stack(
              children: [
                const Icon(Icons.notifications_none,
                    color: AppColors.whiteColor, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.buttonPrimary,
                    child: const Text(
                      "2",
                      style: TextStyle(
                          color: AppColors.whiteColor, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopHeader(context),
            const SizedBox(height: 120),
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
                    builder: (context) => LanguageSelectionScreen(),
                  ),
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
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
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
                    builder: (context) => LocalitySelectionScreen(),
                  ),
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            "john@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            "+41-12311-10245",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.blueAccent, size: 20),
                    SizedBox(height: 4),
                    Text("4.5", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          left: 20,
          right: 20,
          child: _buildEarningsCard(context),
        ),
      ],
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
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Earnings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.play_circle_fill, color: Colors.black),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyEarningsScreen()),
                      );
                    }),
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

  const _EarningItem({
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
    );
  }
}
