import 'package:flutter/material.dart';

class OrderPages extends StatefulWidget {
  const OrderPages({super.key});

  @override
  State<OrderPages> createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the Order Page',
          style: TextStyle(fontSize: 24, color: Colors.deepPurple),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the button
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}