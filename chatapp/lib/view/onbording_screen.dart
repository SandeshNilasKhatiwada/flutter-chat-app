import 'package:chatapp/intro_screen/intro_page_1.dart';
import 'package:chatapp/intro_screen/intro_page_2.dart';
import 'package:chatapp/intro_screen/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  // Controller to keep track of which page we're on
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        children: [IntroPage1(), IntroPage2(), IntroPage3()],
      ),
      Container(
          alignment: Alignment(0, 0.75),
          child: SmoothPageIndicator(controller: _controller, count: 3))
    ]));
  }
}
