import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/custom_widgets/pieButton.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:pie_chart/pie_chart.dart';

class MyEarningsScreen extends StatelessWidget {
  final Map<String, double> dataMap = {"Order Pay": 17, "Tips": 4};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppPallete.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppPallete.backgroundColor,
          elevation: 0,
          title: const Text(
            'My Earnings',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: AppColors.orangeColor,
            unselectedLabelColor: AppColors.black,
            indicatorColor: AppColors.orangeColor,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //daily
            _buildDailyEarningsContent(),
            // week
            _buildMountlyEarningsContent(),
            // mounth
            _buildMountlyEarningsContent(),
          ],
        ),
      ),
    );
  }

  //! daily card
  Widget _buildDailyEarningsContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),

          /// Top Date Selector
          Container(
            color: AppColors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Today",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// Row with trip/order/login hour stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _InfoBox(title: '10', subtitle: 'Trips'),
              _InfoBox(title: '5', subtitle: 'Orders'),
              _InfoBox(title: '4', subtitle: 'Login Hrs'),
            ],
          ),

          const SizedBox(height: 24),

          /// Earnings Card
          _DailyCenterCard(),

          const SizedBox(height: 30),

          PieMenu(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  //! Mountly card
  Widget _buildMountlyEarningsContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),

          /// Top Date Selector
          Container(
            color: AppColors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "August",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// Row with trip/order/login hour stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _InfoBox(title: '32', subtitle: 'Trips'),
              _InfoBox(title: '48', subtitle: 'Orders'),
              _InfoBox(title: '42', subtitle: 'Login Hrs'),
            ],
          ),

          const SizedBox(height: 24),

          /// Earnings Card
          _MountlyCenterCard(),

          const SizedBox(height: 30),

          /// Pie Chart
          PieMenu(),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  //? _MountlyCenterCard
  Widget _MountlyCenterCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Earnings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "₹210",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.redColors,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Breakdown Container
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    /// Order Pay
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earnBox,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Order Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("Earnings per order"),
                      trailing: const Text(
                        "₹175",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),

                    const Divider(indent: 16, endIndent: 16),

                    /// Distance Pay
                    _breakdownRow("Distance Pay", "₹120"),

                    /// Min. Base Pay
                    _breakdownRow("Min. Base Pay", "₹25"),

                    const Divider(indent: 16, endIndent: 16),

                    /// Target Pay
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earntarget,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Target Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        "Earnings for reaching order targets",
                      ),
                      trailing: const Text(
                        "₹0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),

                    const Divider(indent: 16, endIndent: 16),

                    /// Customer Tips
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earnCost,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Customer Tips",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("Rewards received from customers"),
                      trailing: const Text(
                        "₹55",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //? _DailyCenterCard
  Widget _DailyCenterCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Earnings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "₹21",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.redColors,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Breakdown Container
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    /// Order Pay
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earnBox,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Order Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("Earnings per order"),
                      trailing: const Text(
                        "₹17",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),

                    const Divider(indent: 16, endIndent: 16),

                    /// Distance Pay
                    _breakdownRow("Distance Pay", "₹15"),

                    /// Min. Base Pay
                    _breakdownRow("Min. Base Pay", "₹2"),

                    const Divider(indent: 16, endIndent: 16),

                    /// Target Pay
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earntarget,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Target Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        "Earnings for reaching order targets",
                      ),
                      trailing: const Text(
                        "₹0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),

                    const Divider(indent: 16, endIndent: 16),

                    /// Customer Tips
                    ListTile(
                      leading: SvgPicture.asset(
                        AllImages.earnCost,
                        width: 50,
                        height: 50,
                      ),
                      title: const Text(
                        "Customer Tips",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("Rewards received from customers"),
                      trailing: const Text(
                        "₹4",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _breakdownRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: AppColors.black)),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoBox({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: AppColors.black)),
      ],
    );
  }
}
