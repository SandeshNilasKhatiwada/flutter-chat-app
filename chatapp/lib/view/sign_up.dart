import 'package:chatapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// Import the user model

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers to capture input data
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedGender = 'male'; // Default gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Go back
                  },
                ),
                const SizedBox(height: 20),

                // Title
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Sign up with Email',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Get chatting with friends and family today by signing up for our chat app!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Name Input Field
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Your name',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Email Input Field
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your email',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm Password Input Field
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Date of Birth Input Field
                TextField(
                  controller: _dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    setState(() {
                      _dobController.text = "${pickedDate?.toLocal()}"
                          .split(' ')[0]; // Format: yyyy-mm-dd
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Gender Dropdown using DropdownButtonFormField
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                  items: <String>['male', 'female', 'others']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Phone Input Field
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final user = User(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        dob: _dobController.text,
                        gender: _selectedGender,
                        phone: _phoneController.text,
                      );

                      // Save user data to Hive
                      var box = await Hive.openBox<User>('users');
                      await box.add(user);

                      // Here you can navigate to the next page or display a message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Account Created Successfully!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
