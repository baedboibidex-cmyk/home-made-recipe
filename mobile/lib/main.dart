import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'app/app.dart';

void main() {
  runApp(const HomeMadeRecipeApp());
}

class HomeMadeRecipeApp extends StatelessWidget {
  const HomeMadeRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Made Recipe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text(
            "🍳 Home Made Recipe",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}