import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/order/widgets/support.dart';

class OrderHistoryDetailsPage extends StatelessWidget {
  const OrderHistoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        elevation: 0,
        title: const Text(
          "Order #123546789",
          style: TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupportScreen()),
              );
            },
            child: const Text(
              "Support",
              style: TextStyle(
                color: AppColors.redColors,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redColors,
                ),
              ),
              const SizedBox(height: 16),
              buildOrderDetail(),
              const SizedBox(height: 16),
              buildDeliveryCompletedCard(),
              const SizedBox(height: 16),
              const Text(
                "Items in Order",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redColors,
                ),
              ),
              const SizedBox(height: 16),
              buildItemSummaryCard(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderDetail() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Merchant Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Testing POS Merchant",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Location, GT Road, Punjab",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Text(
                "\$150.00",
                style: TextStyle(
                  color: AppColors.redColors,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Home Location
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AllImages.destination, width: 24, height: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Home", style: TextStyle(fontWeight: FontWeight.w600)),
                    Text(
                      "#744, UE, Phase-II, Ludhiana",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Text(
                "3.5km",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Items Ordered
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AllImages.foodIcon, width: 24, height: 24),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const Divider(height: 32),

          // Billing Info
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Billed to", style: TextStyle(color: AppColors.darkGrey)),
              Text("Status", style: TextStyle(color: AppColors.darkGrey)),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("John Doe", style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                "Success",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(height: 32),
          const SizedBox(height: 16),
          // Ask for Review and Tip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.grey),
                      Icon(Icons.star, color: Colors.grey),
                      Icon(Icons.star, color: Colors.grey),
                      Icon(Icons.star, color: Colors.grey),
                      Icon(Icons.star, color: Colors.grey),
                    ],
                  ),

                  TextButton(
                    onPressed: () {
                      // Handle ask for review action
                    },
                    child: Text(
                      "Ask for Review",
                      style: TextStyle(
                        color: AppColors.redColors,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  // Empty left side under stars
                  Text(
                    "Tip Earned",
                    style: TextStyle(color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "USD 5",
                    style: TextStyle(
                      color: AppColors.redColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          const Divider(height: 32),

          // Dates
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Placed on",
                style: TextStyle(color: AppColors.darkGrey),
              ),
              Text(
                "Delivery Time",
                style: TextStyle(color: AppColors.darkGrey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "April 08, 10:15 PM",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "April 08, 10:45 PM",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }


Widget buildDeliveryCompletedCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors.grey,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Delivery Completed", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Row(
                children: List.generate(
                  5,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.tealColors.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text("5/5", style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Approx Pay", style: TextStyle(fontSize: 16)),
            Text(
              "USD 50",
              style: TextStyle(color: AppColors.redColors, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget buildItemSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chicken Biryani Item
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.circle, color: AppColors.redColors, size: 12),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chicken Biryani",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Toppings with Capsicum | Tomato",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Customized",
                      style: TextStyle(
                        color: AppColors.redColors,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.tealColors,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Mayo",
                          style: TextStyle(color: AppColors.tealColors),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.tealColors,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Cheese Dip",
                          style: TextStyle(color: AppColors.tealColors),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.tealColors,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Mayonnnise Spread",
                          style: TextStyle(color: AppColors.tealColors),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text("x2", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          const Divider(height: 32),

          // French Fries Item
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.circle,
                color: AppColors.secondaryColor,
                size: 12,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "French Fries",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Text("x1", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          const Divider(height: 32),

          // Notes
          const Text("Notes", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const Text("Prefer Salted, Less Spicy, without Gravy"),
          const Divider(height: 32),

          // Tip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Tip", style: TextStyle(color: AppColors.redColors)),
              Text("₹5", style: TextStyle(color: AppColors.redColors)),
            ],
          ),
          const Divider(height: 32),

          // Amount to Collect
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Amount to Collect",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "₹155",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redColors,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
