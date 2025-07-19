import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class PieMenu extends StatefulWidget {
  @override
  _PieMenuState createState() => _PieMenuState();
}

class _PieMenuState extends State<PieMenu> {
  bool showPie = false;

  String selectedOption = ""; // "Date", "Order", "Tips"

  void onDateTap() {
    setState(() {
      selectedOption = "Date";
    });
    print("Date tapped");
  }

  void onOrderEarningsTap() {
    setState(() {
      selectedOption = "Order";
    });
    print("Order Earnings tapped");
  }

  void onTipsTap() {
    setState(() {
      selectedOption = "Tips";
    });
    print("Tips tapped");
  }

  @override
  Widget build(BuildContext context) {
    double size = 300;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pie Chart Background
          AnimatedOpacity(
            opacity: showPie ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: CustomPaint(
              size: Size(size, size),
              painter: PiePainter("Both"),
            ),
          ),

          // Menu Options
          if (showPie) ...[
            // Date
            Positioned(
              top: 60,
              child: GestureDetector(
                onTap: onDateTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedOption == "Date"
                        ? AppColors.redColors
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: selectedOption == "Date"
                          ? AppColors.whiteColor
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),

            // Order Earnings
            Positioned(
              left: 40,
              bottom: 100,
              child: GestureDetector(
                onTap: onOrderEarningsTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedOption == "Order"
                        ? AppColors.redColors
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Order\nEarnings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == "Order"
                          ? AppColors.whiteColor
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),

            // Tips
            Positioned(
              right: 50,
              bottom: 100,
              child: GestureDetector(
                onTap: onTipsTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedOption == "Tips"
                        ? AppColors.redColors
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Tips",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: selectedOption == "Tips"
                          ? AppColors.whiteColor
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Center Button
          GestureDetector(
            onTap: () {
              setState(() {
                showPie = !showPie;
                selectedOption = ""; // Reset selection
              });
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.redColors,
              child: Icon(Icons.filter_alt, color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class PiePainter extends CustomPainter {
  final String selected;
  PiePainter(this.selected);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweepAngle = 2 * pi / 3;

    // Slice 1 - Top (Date)
    paint.color = AppColors.redColors.withOpacity(0.8);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 - sweepAngle / 2,
      sweepAngle,
      true,
      paint,
    );

    // Slice 2 - Bottom Left (Order Earnings)
    paint.color = AppColors.whiteColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2 - sweepAngle,
      sweepAngle,
      true,
      paint,
    );

    // Slice 3 - Bottom Right (Tips)
    paint.color = AppColors.whiteColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2,
      sweepAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
