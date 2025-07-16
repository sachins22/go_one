import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/account/widgets/language_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/locality_selection_screen.dart';
import 'package:go_one_app/views/account/widgets/notification_screen.dart';

import '../../core/custom_widgets/custome_card.dart';

class AccountPages extends StatelessWidget {
  const AccountPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopHeader(),
              const SizedBox(height: 80),
              // Ratings Card
              CustomCard(
                onPressed: () {
                  // Define your action here
                },
                widthCard: MediaQuery.of(context).size.width * 0.9,
                heightCard: 100,
                title: "Ratings",
                subtitle: "Check customer remarks and ratings received",
              ),
              const SizedBox(height: 20),

              // Payout Terms Card
              CustomCard(
                 onPressed: () {
                  // Define your action here
                },
                widthCard: MediaQuery.of(context).size.width * 0.9,
                heightCard: 100,
                title: "Payout Terms",
                subtitle: "Check how you could earn and payment credits in your account.",
              ),
              const SizedBox(height: 20),

              // Language Card
              CustomCard(
                 onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LanguageSelectionScreen(),
                    ),
                  );
                },
                widthCard: MediaQuery.of(context).size.width * 0.9,
                heightCard: 100,
                title: "Language",
                subtitle: "English (United States)",
              ),
              const SizedBox(height: 20),

              // Notifications Area Card
              CustomCard(
                 onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                widthCard: MediaQuery.of(context).size.width * 0.9,
                heightCard: 100,
                title: "Notifications Area",
                subtitle: "Appreaciations & other notifications if applicable",
              ),
              const SizedBox(height: 20),

              // Localities Card
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
      ),
    );
  }

  Widget _buildTopHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          decoration: const BoxDecoration(
            color: AppColors.loginPageTopColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AllImages.foodIcon, height: 40),
                    const SizedBox(width: 8),
                    const Text(
                      "Food Love",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Stack(
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
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AllImages.user),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: [
                        Icon(Icons.star, color: Colors.blueAccent, size: 20),
                        SizedBox(height: 4),
                        Text("4.5", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          left: 20,
          right: 20,
          child: _buildEarningsCard(),
        ),
       
      ],
    );
  }

  Widget _buildEarningsCard() {
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
              children: const [
                _EarningItem(title: "Total Earnings", value: "Rs. 750"),
                _EarningItem(title: "Tips Earned", value: "Rs. 50"),
                _EarningItem(title: "Orders Served", value: "25"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingsCard() {
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ratings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _EarningItem extends StatelessWidget {
  final String title;
  final String value;
  const _EarningItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
