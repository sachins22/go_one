import 'package:flutter/material.dart';
import 'package:go_one_app/core/custom_widgets/elevated_button.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          const Divider(height: 1),
          _buildTile("Customer doesn’t pay the COD amount"),
          _buildTile("Customer misbehaved"),
          _buildTile("My tip was not received"),

          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I have concern regarding my trip earning",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                  const SizedBox(height: 20),
            Text(
              "Let us know, whats your concern about?",
              
            ),
            
            const SizedBox(height: 20,),
             AppElevatedButton(
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    text: "Contact Us",
                    buttonWidth: 150,
                    buttonHeight: 30,
                    onPressed: () {},
                  ),
              ],
            ),
          ),

        
          const SizedBox(height: 30),

          // Emergency Box
          Container(
            color: Colors.red.shade50,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Emergency",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Don't panic, we are here to help you"),
                const SizedBox(height: 12),
                AppElevatedButton(
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  text: "Contact Us",
                  buttonWidth: 150,
                  buttonHeight: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String title) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // You can add your navigation or actions here
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
