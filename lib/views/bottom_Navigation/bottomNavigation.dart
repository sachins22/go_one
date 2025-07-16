import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_one_app/core/All_Image/allImage.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/account/account.dart';
import 'package:go_one_app/views/deposit/deposit.dart';
import 'package:go_one_app/views/home/home.dart';
import 'package:go_one_app/views/order/order.dart';

class BottomNavigationPages extends StatefulWidget {
  const BottomNavigationPages({super.key});

  @override
  State<BottomNavigationPages> createState() => _BottomNavigationPagesState();
}

class _BottomNavigationPagesState extends State<BottomNavigationPages> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
         HomePages(),
    const OrderPages(),
    const DepositPages(),
    const AccountPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30), // Rounded curved effect
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.loginPageTopColor,
            unselectedItemColor: AppColors.black,
            currentIndex: selectedIndex,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AllImages.profile,
                  width: 24,
                  height: 24,
                  color: selectedIndex == 0
                      ? AppColors.loginPageTopColor
                      : AppColors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AllImages.order,
                  width: 24,
                  height: 24,
                  color: selectedIndex == 1
                      ? AppColors.loginPageTopColor
                      : AppColors.black,
                ),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AllImages.cash,
                  width: 24,
                  height: 24,
                  color: selectedIndex == 2
                      ? AppColors.loginPageTopColor
                      : AppColors.black,
                ),
                label: 'Deposit',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AllImages.account,
                  width: 24,
                  height: 24,
                  color: selectedIndex == 3
                      ? AppColors.loginPageTopColor
                      : AppColors.black,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
