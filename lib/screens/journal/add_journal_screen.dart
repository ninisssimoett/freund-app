import 'package:flutter/material.dart';
import 'package:freud_app/screens/journal/my_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AddJournalScreen extends StatefulWidget {
  const AddJournalScreen({super.key});

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  String selected = "Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
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

                // title
                Positioned(
                  left: 22,
                  bottom: 85,
                  child: Text(
                    "Add New Journal",
                    style: GoogleFonts.urbanist(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),

                // button
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF372315),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // text button
                        GestureDetector(
                          onTap: () => setState(() => selected = "Text"),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 13,
                            ),
                            decoration: BoxDecoration(
                              color: selected == "Text"
                                  ? const Color(0xFF704A33)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Text",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selected == "Text"
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // voice button
                        GestureDetector(
                          onTap: () => setState(() => selected = "Voice"),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 13,
                            ),
                            decoration: BoxDecoration(
                              color: selected == "Voice"
                                  ? const Color(0xFF704A33)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Voice",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selected == "Voice"
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          Align(
            alignment: const Alignment(-0.89, 0),
            child: Text(
              "Journal Title",
              style: GoogleFonts.urbanist(
                color: const Color(0xFF372315),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/icon2.png', width: 24, height: 24),

                const SizedBox(width: 8), // jarak icon ke text
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Feeling Bad Again...",
                      hintStyle: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Image.asset('assets/images/icon3.png', width: 24, height: 24),
              ],
            ),
          ),

          const SizedBox(height: 40),

          Align(
            alignment: const Alignment(-0.89, 0),
            child: Text(
              "Write Your Entry",
              style: GoogleFonts.urbanist(
                color: const Color(0xFF372315),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 13),

          // box bawah
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF704A33), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 11,
                  spreadRadius: 1,
                  offset: Offset(0, 0), // shadow semua sisi
                ),
              ],
            ),
            child: TextField(
              controller: contentController,
              maxLines: null,
              expands: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Write everything you feel...",
              ),
            ),
          ),
          const SizedBox(height: 22),

          Align(
            alignment: const Alignment(-0.89, 0),
            child: Text(
              "Stress Level",
              style: GoogleFonts.urbanist(
                color: const Color(0xFF372315),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 90),

          Align(
            alignment: const Alignment(-0.89, 0),
            child: Text(
              "Select Your Emotion",
              style: GoogleFonts.urbanist(
                color: const Color(0xFF372315),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyJournalScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/icon4.png",
                    width: 90,
                    height: 90,
                  ),
                ),

                const SizedBox(width: 10),

                Image.asset("assets/images/icon5.png", width: 73, height: 73),
                const SizedBox(width: 10),

                Image.asset("assets/images/icon6.png", width: 80, height: 85),
                const SizedBox(width: 10),

                Image.asset("assets/images/icon7.png", width: 80, height: 85),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
