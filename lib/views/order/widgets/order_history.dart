import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/pieButton.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/order/widgets/order_history_detail.dart';
import 'package:go_one_app/views/order/widgets/oreder_canceled_details.dart';

class OrderHistoryPages extends StatefulWidget {
  const OrderHistoryPages({super.key});

  @override
  State<OrderHistoryPages> createState() => _OrderHistoryPagesState();
}

class _OrderHistoryPagesState extends State<OrderHistoryPages> {
  int selectedIndex = 0;
  final List<String> tabTitles = ['Fullfilled', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        elevation: 0,
        title: const Text(
          "Order History",
          style: TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(
                  bottom: 100,
                ), // space for PieMenu
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTabs(),
                        const SizedBox(height: 16),
                        ...(selectedIndex == 0
                            ? [
                                buildOrderHistoryfirstCard(
                                  context,
                                  hasReviewed: true,
                                ),

                                const SizedBox(height: 16),
                                buildOrderHistorySecCard(),
                              ]
                            : [
                                buildOrderCanceledHistoryCard(),
                                const SizedBox(height: 16),
                                buildOrderCanceledHistoryCard(),
                              ]),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // Always at bottom
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Center(child: PieMenu()),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabTitles.length, (index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 24),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  AppPallete.transparentColor,
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: Column(
                children: [
                  Text(
                    tabTitles[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 100,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.buttonPrimary
                          : AppPallete.transparentColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // fullfilled orders widget
  Widget buildOrderHistoryfirstCard(
    BuildContext context, {
    bool hasReviewed = false,
    // String reviewRemarks = "Tasty food and timely delivery.",
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                      "GT Road, Ludhiana.",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Text(
                "₹150.50",
                style: TextStyle(
                  color: AppColors.black,
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
              SvgPicture.asset(AllImages.destination, height: 24, width: 24),
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
            ],
          ),
          const SizedBox(height: 16),

          // Items Ordered
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AllImages.foodIcon, height: 24, width: 24),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Order Received"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Delivery Time"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("01:10 PM", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("01:45 PM", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider(height: 32),

          // Footer Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rating + Review / Ask for Review
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: hasReviewed
                              ? AppColors.liteYellowColors
                              : AppColors.whiteColor,
                          size: 16,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 4),
                  hasReviewed
                      ? Text(
                          "Remarks",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.redColors,
                          ),
                        )
                      : const Text(
                          "Ask for Review",
                          style: TextStyle(
                            color: AppColors.redColors,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ],
              ),

              // Details & Completed
              Row(
                children: [
                  const Text(
                    "Details",
                    style: TextStyle(
                      color: AppColors.redColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tealColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const OrderHistoryDetailsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOrderCanceledHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                      "GT Road, Ludhiana.",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Text(
                "₹150.50",
                style: TextStyle(
                  color: AppColors.black,
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
              SvgPicture.asset(AllImages.destination, height: 24, width: 24),
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
            ],
          ),
          const SizedBox(height: 16),

          // Items Ordered
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AllImages.foodIcon, height: 24, width: 24),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Order Received"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Delivery Time"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("01:10 PM", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("01:45 PM", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider(height: 32),

          // Footer Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Distance",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "3.5km",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              // Details & Completed
              Row(
                children: [
                  TextButton(
                    onPressed: () {},

                    child: const Text(
                      "Details",
                      style: TextStyle(
                        color: AppColors.redColors,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.redColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrderCanceledDetailsPage(),
                        ),
                      ),
                      child: Text(
                        "Cancelled",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOrderHistorySecCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                      "GT Road, Ludhiana.",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Text(
                "₹150.50",
                style: TextStyle(
                  color: AppColors.black,
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
              SvgPicture.asset(AllImages.destination, height: 24, width: 24),
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
            ],
          ),
          const SizedBox(height: 16),

          // Items Ordered
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AllImages.foodIcon, height: 24, width: 24),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Order Received"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined, size: 20),
                  SizedBox(width: 4),
                  Text("Delivery Time"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("01:10 PM", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("01:45 PM", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider(height: 32),

          // Footer Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rating + Review
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          color: AppColors.liteYellowColors,
                          size: 16,
                        );
                      }),
                    ),
                  ),
                ],
              ),

              // Details & Completed
              Row(
                children: [
                  const Text(
                    "Details",
                    style: TextStyle(
                      color: AppColors.redColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tealColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const OrderHistoryDetailsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
