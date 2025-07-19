import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';
import 'package:go_one_app/views/deposit/widgets/Transactions_detail.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {
      'title': 'GoOne Wallet',
      'date': '19 January, 2019',
      'amount': '₹125',
      'status': 'Successful',
    },
    {
      'title': 'Payout Deduction',
      'date': '20 January, 2019',
      'amount': '₹1215',
      'status': 'Successful',
    },
    {
      'title': 'GoOne Wallet',
      'date': '19 January, 2019',
      'amount': '₹125',
      'status': 'Successful',
    },
    {
      'title': 'Payout Deduction',
      'date': '20 January, 2019',
      'amount': '₹1215',
      'status': 'Successful',
    },
    {
      'title': 'GoOne Wallet',
      'date': '19 January, 2019',
      'amount': '₹125',
      'status': 'Successful',
    },
    {
      'title': 'Payout Deduction',
      'date': '20 January, 2019',
      'amount': '₹1215',
      'status': 'Successful',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Transactions', style: TextStyle(color: AppColors.black)),
        backgroundColor: AppPallete.backgroundColor,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionDetailScreen(
                          id: '1234566789',
                          amount: tx['amount']!.replaceAll('\$', ''),
                          type: tx['title'] == 'GoOne Wallet'
                              ? 'Deposit'
                              : 'Deduction',
                          status: tx['status']!,
                          card: '**** **** **** 0012',
                          date: tx['date']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGrey,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx['title']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                tx['date']!,
                                style: TextStyle(color: AppColors.darkGrey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              tx['amount']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              tx['status']!,
                              style: TextStyle(
                                color: AppColors.redColors,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.darkGrey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "«Prev",
                    style: TextStyle(color: AppColors.darkGrey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Next»",
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
