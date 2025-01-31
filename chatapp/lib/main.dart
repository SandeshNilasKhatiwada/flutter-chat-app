import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', // Set initial screen to Register
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
