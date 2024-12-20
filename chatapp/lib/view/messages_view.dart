import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

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
          // Status Bar - Horizontally scrollable (outside the card)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // My Status (first circular status)
                  _statusAvatar(
                    context,
                    'My Status',
                    'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg',
                    isDarkMode,
                    isMyStatus: true,
                  ),

                  // Other users' statuses
                  for (int i = 1; i < 5; i++)
                    _statusAvatar(
                      context,
                      'Contact $i',
                      'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg',
                      isDarkMode,
                    ),
                ],
              ),
            ),
          ),

          const Divider(
              color: Colors
                  .grey), // Optional: Divider between status and message list

          // Card for Message List - now takes full screen height
          Expanded(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Message List - inside the card
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5, // Adjust for the number of messages
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors
                            .transparent, // No visible separator between items
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
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Last message preview...',
                            style: TextStyle(
                              color: isDarkMode
                                  ? Colors.grey.shade500
                                  : Colors.black54,
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
                                      : Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
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
            ),
          ),
        ],
      ),
    );
  }

  // Function to create circular status avatars
  Widget _statusAvatar(
      BuildContext context, String name, String imageUrl, bool isDarkMode,
      {bool isMyStatus = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              // Outer circle for status
              CircleAvatar(
                radius: 30,
                backgroundColor: isMyStatus
                    ? Colors.blueAccent // Special color for "My Status"
                    : (isDarkMode
                        ? Colors.grey.shade700
                        : Colors.grey.shade300),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              if (isMyStatus)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green, // Green to show it's active
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
