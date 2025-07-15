import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page',
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