import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyEarningsScreen extends StatelessWidget {
  final Map<String, double> dataMap = {
    "Order Pay": 17,
    "Tips": 4,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Earnings'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '₹750',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildEarningsContent(),
            Center(child: Text("Weekly Earnings")),
            Center(child: Text("Monthly Earnings")),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _InfoBox(title: '10', subtitle: 'Trips'),
              _InfoBox(title: '5', subtitle: 'Online'),
              _InfoBox(title: '4', subtitle: 'Login hours'),
            ],
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Earnings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text("Order Pay"),
                    trailing: Text("₹17"),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text("Distance Pay"),
                    trailing: Text("₹15"),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.grey),
                    title: Text("Details"),
                    subtitle: Text("Hold to fill the following details"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '+42131345',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.green),
              title: Text("Customer Tips"),
              trailing: Text("₹4"),
            ),
          ),
          const SizedBox(height: 16),
          PieChart(
            dataMap: dataMap,
            chartType: ChartType.ring,
            chartRadius: 120,
            baseChartColor: Colors.grey[200]!,
            colorList: [Colors.orange, Colors.green],
            legendOptions: const LegendOptions(showLegends: true),
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValues: true,
            ),
          ),
          const SizedBox(height: 20),
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
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
