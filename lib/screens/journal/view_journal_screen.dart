import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewJournalScreen extends StatefulWidget {
  const ViewJournalScreen({super.key});

  @override
  State<ViewJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<ViewJournalScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
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
                  bottom: 40,
                  child: Text(
                    "View Journal",
                    style: GoogleFonts.urbanist(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title of the journal goes here", 
                    style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF736B66),
                    ),
                  ),

                  const SizedBox(height: 18),
                  Text(
                    "Today was a really fun day! I met my friends at the park and "
                    "we played games together. We laughed a lot and spent quality "
                    "time together. I really enjoyed every moment of it and I hope "
                    "to experience more days like this.",
                    style: GoogleFonts.urbanist(
                      fontSize: 17,
                      height: 1.55,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF736B66),
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
}
