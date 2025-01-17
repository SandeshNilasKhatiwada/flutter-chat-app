import 'package:chatapp/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:chatapp/model/user.dart';
// Assuming this is the Login page

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  // Function to log out the user (clear the Hive box or remove specific user data)
  Future<void> _logout(BuildContext context) async {
    // Access the 'users' box to remove the stored user data
    var box = await Hive.openBox<User>('users');

    // Clear all data or remove specific user data, depending on your use case
    await box
        .clear(); // This will remove all users in the box (or you can remove a specific user)

    // After logging out, navigate back to the Login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Settings Page',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            // Logout Button
            ElevatedButton(
              onPressed: () => _logout(context),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
