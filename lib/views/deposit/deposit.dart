import 'package:flutter/material.dart';

class DepositPages extends StatefulWidget {
  const DepositPages({super.key});

  @override
  State<DepositPages> createState() => _DepositPagesState();
}

class _DepositPagesState extends State<DepositPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the Deposit Page',
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