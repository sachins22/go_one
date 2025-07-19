import 'package:flutter/material.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/notification/notification_main.dart';
import 'package:go_one_app/views/order/widgets/order_history.dart';
import 'package:go_one_app/views/order/widgets/oreder_canceled_details.dart';



class OrderPages extends StatefulWidget {
  const OrderPages({super.key});

  @override
  State<OrderPages> createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
  // Define the tab titles
  int selectedIndex = 0;
  final List<String> tabTitles = ['New', 'Active', 'Map'];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(),
            const SizedBox(height: 120),
            _buildTabs(),
            const SizedBox(height: 20),
            if (selectedIndex == 0) ...[
              _buildNewOrders(),
              const SizedBox(height: 20),
              _buildNewOrders(),
            ],
            if (selectedIndex == 1) ...[
              _buildActiveOrders(),
              const SizedBox(height: 20),
              _buildActiveOrders(),
            ],
            if (selectedIndex == 2) ...[
              _buildMapView(),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 130, // Reduced height since AppBar is used now
          decoration: const BoxDecoration(
            color: AppColors.loginPageTopColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Order #442123456",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: AppColors.black.withOpacity(0.6),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "30 mins left",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Order Ready by Merchant",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.NeworderButtonColor, // light blue
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Ready to Pickup",
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Build the tabs
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
                    width: 60,
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

  // new orders section
  Widget _buildNewOrders() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Testing POS Merchant",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "GT Road, Ludhiana.",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "₹150.50",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "COD",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.buttonPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.location_on_outlined, color: AppColors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Home\n#744, UE, Phase-II, Ludhiana",
                      style: TextStyle(color: AppColors.black, fontSize: 14),
                    ),
                  ),
                  Text(
                    "3.5km",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.restaurant_menu, color: AppColors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18),
                          SizedBox(width: 6),
                          Text(
                            "Order Received",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 6),
                        ],
                      ),
                      Text(
                        "01:10 PM",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18),
                          SizedBox(width: 6),
                          Text(
                            "Delivery Time",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 6),
                        ],
                      ),
                      Text(
                        "01:45 PM",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AppElevatedButton(
                      text: "Decline",
                      buttonWidth: 100,
                      buttonHeight: 30,
                      onPressed: () {},
                      textColor: AppColors.whiteColor,
                      backgroundColor: AppColors.buttonPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppElevatedButton(
                      text: "Accept",
                      buttonWidth: 100,
                      buttonHeight: 30,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderHistoryPages(),
                          ),
                        );
                      },
                      textColor: AppColors.black,
                      backgroundColor: AppColors.NeworderButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Build the Active section
  Widget _buildActiveOrders() {
    // Placeholder for active orders
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// MERCHANT INFO & AMOUNT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Testing POS Merchant",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "GT Road, Ludhiana.",
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.3),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "\$150.50",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "COD",
                    style: TextStyle(
                      color: AppColors.buttonPrimary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// LOCATION
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "#744, UE, Phase-II, Ludhiana",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black.withOpacity(0.5)),
                ),
                child: const Icon(Icons.navigation, size: 18),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ORDER ITEMS
          Row(
            children: [
              Icon(
                Icons.restaurant_menu,
                color: AppColors.black.withOpacity(0.8),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "French Fries(1), Chicken Biryani(2), Smoky Chicken BBQ Burger(1)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TIME INFO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Order Received",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                  Text(
                    "01:10 PM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Delivery Time",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                  Text(
                    "01:45 PM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// BOTTOM BUTTONS
          Row(
            children: [
              /// Call Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  size: 16,
                  color: AppColors.whiteColor,
                ),
                label: const Text(
                  "Call",
                  style: TextStyle(fontSize: 14, color: AppColors.whiteColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const Spacer(),

              /// Details Text
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Details",
                  style: TextStyle(
                    color: AppColors.buttonPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// Pickup Ready
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.NeworderButtonColor, // light blue
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Pickup Ready",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    // Placeholder for map view

    return Container(
      height: 350,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Stack(
        children: [
          // 🔁 Replace with your image (local or network)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AllImages.MapCon, // ✅ Your image path here
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // 📦 Bottom card
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📍 Location row
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "#321, Phase-II, UE, Ludhiana, India...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // 🔢 Orders and Distance
                  Row(
                    children: [
                      _buildInfoBox("4", "Active Orders"),
                      const SizedBox(width: 10),
                      _buildInfoBox("12.5 km", "Total Distance"),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
