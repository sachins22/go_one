import 'package:flutter/material.dart';
import 'package:go_one_app/core/theme/app_pallete.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'name': 'English', 'flag': '🇺🇸'},
    {'name': 'Nederlands', 'flag': '🇳🇱'},
    {'name': 'Français', 'flag': '🇫🇷'},
    {'name': 'Deutsch', 'flag': '🇩🇪'},
    {'name': 'Italiano', 'flag': '🇮🇹'},
    {'name': 'Português', 'flag': '🇵🇹'},
    {'name': 'Español', 'flag': '🇪🇸'},
    {'name': 'عربى', 'flag': '🇦🇪'},
    {'name': 'हिंदी', 'flag': '🇮🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        title: const Text('Choose Language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];
          return ListTile(
            leading: Text(language['flag'] ?? '', style: const TextStyle(fontSize: 24)),
            title: Text(language['name'] ?? ''),
            trailing: selectedLanguage == language['name']
                ? const Icon(Icons.check, color: AppColors.secondaryColor)
                : null,
            onTap: () {
              setState(() {
                selectedLanguage = language['name']!;
              });
            },
          );
        },
      ),
    );
  }
}
