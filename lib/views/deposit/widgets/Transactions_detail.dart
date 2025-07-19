import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class TransactionDetailScreen extends StatelessWidget {
  final String id;
  final String amount;
  final String type;
  final String status;
  final String card;
  final String date;

  const TransactionDetailScreen({
    super.key,
    required this.id,
    required this.amount,
    required this.type,
    required this.status,
    required this.card,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // Yellow Top Half
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: AppColors.liteYellowColors,
          ),

          // Main Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Transaction Detail",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Transaction ID
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transaction Id",
                      style: TextStyle(color: AppColors.black),
                    ),
                    Text(
                      id,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // White Card
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: AppColors.darkGrey, blurRadius: 6),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top amount and Razor Pay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$amount INR",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Razor Pay",
                            style: TextStyle(color: AppColors.redColors),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Type",
                            style: TextStyle(color: AppColors.black),
                          ),
                          const Text(
                            "Status",
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            status,
                            style: const TextStyle(color: AppColors.success),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Card",
                        style: TextStyle(color: AppColors.black),
                      ),
                      Text(
                        card,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          date,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
