import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  final String selectedMood;

  const HistoryScreen({super.key, required this.selectedMood});

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('d').format(DateTime.now());
    String month = DateFormat('MMM').format(DateTime.now());
    String weekday = DateFormat('EEE').format(DateTime.now());

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
              color: Color(0xFF4F3422),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/back_button.png',
                      width: 42,
                      height: 42,
                    ),
                  ),
                ),

                Positioned(
                  left: 22,
                  bottom: 85,
                  child: Text(
                    "My Mood",
                    style: GoogleFonts.urbanist(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                // history
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF704A33),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All",
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4F3422),
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.black54),
              ],
            ),
          ),

          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F3EE),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // kotak tgl
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        month,
                        style: GoogleFonts.urbanist(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        day, 
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              selectedMood,
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          Image.asset(
                            'assets/images/icon1.png',
                            width: 45,
                            height: 45,
                          ),
                        ],
                      ),

                      const SizedBox(height: 3),

                      // hati sm plus 
                      Transform.translate(
                        offset: const Offset(0,-8), // makin negatif = makin naik
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 18,
                                  color: Colors.redAccent,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "96 bpm",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 18),

                            Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "121 sys",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
