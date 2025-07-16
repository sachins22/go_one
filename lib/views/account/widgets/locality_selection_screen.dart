import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class LocalitySelectionScreen extends StatefulWidget {
  @override
  _LocalitySelectionScreenState createState() => _LocalitySelectionScreenState();
}

class _LocalitySelectionScreenState extends State<LocalitySelectionScreen> {
  List<String> localities = [
    'Dugri',
    'Model Town',
    'BRS Nagar',
    'Sarabha Nagar',
    'Basant Avenue',
    'Civil Lines',
    'Janta Enclave',
    'SBS Nagar',
  ];

  Set<String> selectedLocalities = {
    'Model Town',
    'BRS Nagar',
    'Sarabha Nagar',
    'Janta Enclave',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        title: const Text('Localities'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Optional: Add search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: localities.length,
        itemBuilder: (context, index) {
          final locality = localities[index];
          final isSelected = selectedLocalities.contains(locality);

          return CheckboxListTile(
            title: Text(locality),
            value: isSelected,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedLocalities.add(locality);
                } else {
                  selectedLocalities.remove(locality);
                }
              });
            },
            activeColor: AppColors.tealColors, // match the theme in the image
            controlAffinity: ListTileControlAffinity.leading,
          );
        },
      ),
    );
  }
}
