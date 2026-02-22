import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "HE – THIS IrrS ThHE START",
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
    );
  }
}