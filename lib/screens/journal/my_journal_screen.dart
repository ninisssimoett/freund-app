import 'package:flutter/material.dart';
import 'package:freud_app/screens/journal/view_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyJournalScreen extends StatefulWidget {
  const MyJournalScreen({super.key});

  @override
  State<MyJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<MyJournalScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String todayDate = DateFormat("dd MMM yyyy").format(DateTime(2025, 11, 28));

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Column(
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
                    "My Journals",
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
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              children: [
                _journalCard(todayDate),
                _journalCard(todayDate),
                _journalCard(todayDate),
                _journalCard(todayDate),
                _journalCard(todayDate),
                _journalCard(todayDate),
                _journalCard(todayDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _journalCard(String todayDate) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ViewJournalScreen(),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/smile_icon.png',
                width: 36,
                height: 36,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF4E0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Happy",
                  style: GoogleFonts.urbanist(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            "I had a very fun day today! I met my ....",
            style: GoogleFonts.urbanist(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF433530),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            todayDate,
            style: GoogleFonts.urbanist(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}
}
