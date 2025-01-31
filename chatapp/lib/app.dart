import 'package:flutter/material.dart';
import 'package:chatapp/core/app_theme/app_theme.dart';
import 'package:chatapp/view/onbording_screen.dart';
import 'package:chatapp/features/auth/presentation/pages/register_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/register': (context) => RegisterPage(), // Add RegisterPage route
      },
    );
  }
}
