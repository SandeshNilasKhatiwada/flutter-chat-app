import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // Add search functionality
          },
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add profile navigation
            },
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Replace with your asset
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Status Row
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6, // Adjust for the number of status
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade800,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          index == 0
                              ? 'assets/my_status.jpg' // Replace with your asset for "My Status"
                              : 'assets/status_$index.jpg', // Replace with other profile images
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      index == 0 ? 'My Status' : 'User $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ),
          const Divider(color: Colors.grey),

          // Chat List
          Expanded(
            child: ListView.separated(
              itemCount: 5, // Adjust for the number of chats
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                height: 1,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/chat_$index.jpg'),
                  ),
                  title: Text(
                    'Contact ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Last message preview...',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  trailing: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 min ago',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
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
                    // Navigate to chat screen
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Message',
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
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
