import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme for both light and dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? Colors.black
          : Colors.grey[200], // Light mode gets a grey background

      body: Column(
        children: [
          const Divider(
              color:
                  Colors.grey), // Optional: Can keep this for initial divider

          // Message List
          Expanded(
            child: ListView.separated(
              itemCount: 5, // Adjust for the number of messages
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent, // No visible separator between items
                height: 1,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg'),
                  ),
                  title: Text(
                    'Contact ${index + 1}',
                    style: TextStyle(
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black, // Text color based on theme
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none, // Ensure no underline
                    ),
                  ),
                  subtitle: Text(
                    'Last message preview...',
                    style: TextStyle(
                      color: isDarkMode
                          ? Colors.grey.shade500
                          : Colors.black54, // Subtitle color based on theme
                      decoration: TextDecoration.none, // Ensure no underline
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 min ago',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.grey.shade500
                              : Colors
                                  .black54, // Time text color based on theme
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to chat screen or perform action
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
