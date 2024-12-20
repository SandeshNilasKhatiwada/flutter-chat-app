import 'package:chatapp/view/base_page.dart';
import 'package:chatapp/view/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

            // Social Media Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Facebook login logic
                    },
                  ),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                    onPressed: () {
                      // Google login logic
                    },
                  ),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.apple, color: Colors.black),
                    onPressed: () {
                      // Apple login logic
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // OR separator
            const Row(
              children: [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            // Email TextField
            TextField(
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BasePage()));
                // Handle login logic
              },
              // style: ElevatedButton.styleFrom(
              //   minimumSize: const Size(double.infinity, 50),
              //   backgroundColor: Colors.grey.shade200,
              //   foregroundColor: Colors.black,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              // ),
              child: const Text(
                'Log in',
                // style: TextStyle(fontFamily: "Montserrat Bold", fontSize: 20),
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
