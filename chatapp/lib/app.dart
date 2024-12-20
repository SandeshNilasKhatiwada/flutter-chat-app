import 'package:chatapp/core/app_theme/app_theme.dart';
import 'package:chatapp/view/onbording_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const OnboardingScreen(),
    );
  }
}
