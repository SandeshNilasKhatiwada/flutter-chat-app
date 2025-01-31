import 'package:chatapp/service/hive_service.dart';
import 'package:chatapp/view/base_page.dart';
import 'package:chatapp/view/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to capture input data
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HiveService _hiveService = HiveService();

  // Show an alert if login failed
  void _showLoginError() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: const Text('Invalid email or password. Please try again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Handle login process
  Future<void> _handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Authenticate the user by checking Hive
    bool isAuthenticated = await _hiveService.authenticateUser(email, password);

    if (isAuthenticated) {
      // Navigate to the base page if credentials are correct
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BasePage()),
      );
    } else {
      // Show an error message if login failed
      _showLoginError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              'Log in to Chatbox',
              style: TextStyle(fontSize: 50, fontFamily: "Montserrat Bold"),
            ),
            const SizedBox(height: 10),

            // Subtitle
            const Text(
              'Welcome back! Sign in using your social account or email to continue us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Email TextField
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text(
                'Log in',
              ),
            ),
            const SizedBox(height: 10),

            // Forgot Password
            TextButton(
              onPressed: () {
                // Navigate to Forgot Password screen
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.teal),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Text(
                'Create an account',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
