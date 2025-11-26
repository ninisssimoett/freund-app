import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> pages = [
    "assets/images/welcome1.png",
    "assets/images/welcome2.png",
    "assets/images/welcome3.png",
    "assets/images/welcome4.png",
    "assets/images/welcome5.png",
  ];

  // atur posisi garisnya
  double progressBarBottomPadding = 300;
  double progressBarWidth = 140;
  double progressBarHeight = 7;

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      print("Finished onboarding");
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentPage + 1) / pages.length;

    return Scaffold(
      body: Stack(
        children: [
          // image fullscreen
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (value) {
              setState(() => currentPage = value);
            },
            itemBuilder: (context, index) {
              return SizedBox.expand(
                child: Image.asset(pages[index], fit: BoxFit.cover),
              );
            },
          ),

          // progress bar
          Positioned(
            bottom: progressBarBottomPadding,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: progressBarWidth,
                height: progressBarHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    width: progressBarWidth * progress,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4B3A2F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // button 
          Positioned(
            // atur posisi buttonnya
            bottom: 75,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: nextPage,
                child: Container(
                  // ukuran 
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B3A2F),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/arrow_right.png',
                      // ukuran arrow
                      width: 26,
                      height: 26,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




