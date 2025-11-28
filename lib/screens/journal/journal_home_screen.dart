import 'package:flutter/material.dart';
import 'package:freud_app/screens/journal/add_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalHomeScreen extends StatelessWidget {
  const JournalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          Positioned.fill(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),

          Positioned(
            top: 55,
            left: 25,
            child: GestureDetector(
              onTap: () {
                // nanti ini
              },
              child: Row(
                children: [
                  // lingkaran + icon back
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(),
                    child: Center(
                      child: Image.asset(
                        "assets/images/back_button.png",
                        width: 50,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                  Text(
                    "Health Journal",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            bottom: 325,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "34",
                    style: GoogleFonts.urbanist(
                      fontSize: 120,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    "Journals this year.",
                    style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // button
          Positioned(
            bottom: 340,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddJournalScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4F3422),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 35),
                ),
              ),
            ),
          ),

          // journal section
          Positioned(
            left: 0,
            right: 0,
            bottom: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title + see all
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Journal Statistics",
                        style: GoogleFonts.urbanist(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF4F3422),
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF9BB167),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // weekdays row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ["M", "T", "W", "T", "F", "S", "S"]
                        .map(
                          (d) => Text(
                            d,
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: const Color(0xFF736B66),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),

                  // calendar dummy
                  Column(
                    children: [
                      circleRow([
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                        'positive',
                        'positive',
                      ]),
                      const SizedBox(height: 12),
                      circleRow([
                        'positive',
                        'positive',
                        'skip',
                        'negative',
                        'skip',
                        'skip',
                        'skip',
                      ]),
                      const SizedBox(height: 12),
                      circleRow([
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                        'skip',
                      ]),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Legend(color: Color(0xFFE7DEDB), text: "Skipped"),
                      SizedBox(width: 25),
                      Legend(color: Color(0xFF9BB167), text: "Positive"),
                      SizedBox(width: 25),
                      Legend(color: Color(0xFFED7E1B), text: "Negative"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  widget pembantu
Widget circle(String type) {
  const map = {
    'skip': Color(0xFFE7DEDB),
    'positive': Color(0xFF9BB167),
    'negative': Color(0xFFED7E1B),
  };
  return Container(
    width: 38,
    height: 38,
    decoration: BoxDecoration(color: map[type], shape: BoxShape.circle),
  );
}

Widget circleRow(List<String> cells) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: cells.map((e) => circle(e)).toList(),
  );
}

class Legend extends StatelessWidget {
  final Color color;
  final String text;
  const Legend({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.urbanist(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF736B66),
          ),
        ),
      ],
    );
  }
}
