import 'package:flutter/material.dart';
import 'package:salah_tracker_fe/kids/tab_kids.dart'; // Correct path based on your structure
// This is a test change for pull request

void main() {
  runApp(const SalahTrackerApp());
}

class SalahTrackerApp extends StatelessWidget {
  const SalahTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salah Tracker Kids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabKids(
        null,
        '2025-06-25',
        'Fajr',
        (val) {},
        (val) {},
        'Hello Kids!',
      ),
    );
  }
}
