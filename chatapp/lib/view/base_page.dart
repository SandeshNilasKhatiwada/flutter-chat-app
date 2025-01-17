import 'package:chatapp/view/messages_view.dart';
import 'package:flutter/material.dart';
import 'calls_view.dart';
import 'contacts_view.dart';
import 'settings_view.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0; // Track the current page index
  bool _isDarkMode = false; // Track dark mode

  // List of titles for the AppBar
  final List<String> _titles = ['Messages', 'Calls', 'Contacts', 'Settings'];

  // List of views for each page
  final List<Widget> _pages = [
    const MessagePage(),
    const CallPage(),
    const ContactsView(),
    const SettingsView(),
  ];

  // Handle navigation bar tap
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Toggle dark mode
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 248),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 246, 247, 248),
          selectedItemColor: Color.fromARGB(255, 47, 36, 36),
          unselectedItemColor: Color.fromARGB(255, 116, 109, 109),
          selectedLabelStyle: TextStyle(
            color: Color.fromARGB(255, 47, 36, 36),
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            color: Color.fromARGB(255, 116, 109, 109),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 33, 33, 33),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 44, 44, 44),
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Color.fromARGB(255, 158, 158, 158),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        resizeToAvoidBottomInset:
            false, // Prevent resizing when keyboard appears
        appBar: AppBar(
          title: Text(_titles[_currentIndex]),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        body: SafeArea(
          child: _pages[_currentIndex], // Ensure content avoids overlapping
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
