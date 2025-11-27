import 'package:flutter/material.dart';

class JournalOverviewScreen extends StatelessWidget {
  const JournalOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FULL BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.png",  // ganti dengan file kamu
              fit: BoxFit.cover,
            ),
          ),

          // WHITE ROUNDED BOTTOM SECTION
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          // PLUS BUTTON (DI TENGAH GARIS ROUNDED)
          Positioned(
            bottom: 160, // supaya nempel di lengkungan
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF4B3A2F),
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
