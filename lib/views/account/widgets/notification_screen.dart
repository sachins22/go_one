import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'orderId': '#442123456',
      'title': 'Pickup Ready by Merchant',
      'date': '29th July, 2021 - 04:32 pm'
    },
    {
      'orderId': '#442123449',
      'title': '5 star rating received from user.',
      'date': '29th July, 2021 - 04:00 pm'
    },
    {
      'orderId': '#442123454',
      'title': 'Order Delivered. Ask for rating.',
      'date': '29th July, 2021 - 03:32 pm'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:AppPallete.backgroundColor,
      appBar: AppBar(
        title: const Text('Notifications Area'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:AppPallete.backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkGrey,
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Order ${item['orderId']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'] ?? ''),
                  const SizedBox(height: 6),
                  Text(
                    item['date'] ?? '',
                    style: const TextStyle(color: AppColors.accentColor, fontSize: 12),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to details if needed
              },
            ),
          );
        },
      ),
     
    );
  }
}
