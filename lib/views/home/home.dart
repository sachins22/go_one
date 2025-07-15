import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Add this in pubspec.yaml


class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selectedIndex = 0;
  int selectedfilterIndex = 0;

  final List<String> filterOptions = ['Quarterly', 'Monthly', 'Weekly'];
  final List<String> tabTitles = ['Profile Stats', 'Range', 'Link Bank Account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(),
            const SizedBox(height: 60),
            _buildTabs(),
            const SizedBox(height: 20),
            if (selectedIndex == 0) ...[
              _buildStatsCard(),
              const SizedBox(height: 20),
              _buildChartFilters(),
              const SizedBox(height: 20),
              _buildBarChart(),
            ] else if (selectedIndex == 1) ...[
              _buildRangeWidget(),
            ],
            const SizedBox(height: 24),
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
          height: 180,
          decoration: const BoxDecoration(
            color: AppColors.loginPageTopColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
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
        ),
        Positioned(
          bottom: -40,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.black,
                    blurRadius: 6,
                    offset: Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(AllImages.user),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Welcome John!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Edit Profile",
                        style: TextStyle(
                            color: AppColors.elveatedbackgroundColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
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
                overlayColor:
                    MaterialStateProperty.all(AppPallete.transparentColor),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: Column(
                children: [
                  Text(
                    tabTitles[index],
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 40,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.loginPageTopColor
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

  Widget _buildStatsCard() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Orders Fulfilled",
                    style: TextStyle(fontWeight: FontWeight.w800)),
                SizedBox(height: 4),
                Text("Last 4 months"),
                Text("Total Orders\n100"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("+7%", style: TextStyle(color: AppColors.secondaryColor)),
                SizedBox(height: 4),
                Text("₹10000",
                    style: TextStyle(fontWeight: FontWeight.w800)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartFilters() {
    return Center(
      child: Wrap(
        spacing: 10,
        children: List.generate(filterOptions.length, (index) {
          final isSelected = selectedfilterIndex == index;
          return FilterChip(
            label: Text(
              filterOptions[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                selectedfilterIndex = index;
              });
            },
            selectedColor: Colors.black87,
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(
              side: BorderSide(
                color: isSelected ? Colors.transparent : Colors.black26,
              ),
            ),
            showCheckmark: false,
          );
        }),
      ),
    );
  }

  Widget _buildBarChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 250,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  getTitlesWidget: (value, _) => Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (val, _) {
                    final labels = ['January', 'February', 'March', 'April'];
                    if (val.toInt() >= 0 && val.toInt() < labels.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          labels[val.toInt()],
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(
                  toY: 55,
                  color: AppColors.elveatedbackgroundColor,
                  width: 22,
                )
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(
                  toY: 78,
                  color: AppColors.elveatedbackgroundColor,
                  width: 22,
                )
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                  toY: 78,
                  color: AppColors.elveatedbackgroundColor,
                  width: 22,
                )
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(
                  toY: 102,
                  color: AppColors.elveatedbackgroundColor,
                  width: 22,
                )
              ]),
            ],
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  Widget _buildRangeWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text("Location"),
                subtitle: Text("#321, Phase-II, UE, Ludhiana, India..."),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: Icon(Icons.social_distance, color: Colors.blue),
                title: Text("Range"),
                subtitle: Text("32 km"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        CircularPercentIndicator(
          radius: 80.0,
          lineWidth: 20.0,
          percent: 0.4,
          center: const Text("32\nkm",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          progressColor: AppColors.darkblue,
          backgroundColor: AppColors.lightBlue,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ],
    );
  }
}
