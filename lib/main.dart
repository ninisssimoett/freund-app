import 'package:flutter/material.dart';
import 'package:freud_app/screens/journal/journal_overview_screen.dart';
import 'package:freud_app/screens/mood/mood_flow_screen.dart';


void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    
      debugShowCheckedModeBanner: false,
      home: JournalOverviewScreen(),
      
    );
  }
}
