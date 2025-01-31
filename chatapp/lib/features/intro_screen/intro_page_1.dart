import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 227, 137, 167),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align content horizontally
          children: [
            Image.asset("assets/images/rb_2148261558.png"),
            const SizedBox(
                height: 20), // Add spacing between the image and text
            const Text(
              "Chat With Your Love One",
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Bold text
                letterSpacing: 1.5, // Spacing between letters
                wordSpacing: 2.0, // Spacing between words
              ),
              textAlign: TextAlign.center, // Center the text horizontally
            ),
          ],
        ),
      ),
    );
  }
}
