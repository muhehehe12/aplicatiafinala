import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Ultra-Premium Dark Theme
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Pure black for OLED
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Color(0xFF1A1A1A), // Deep grey for cards
          surface: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.oswald(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      );

  static ThemeData get lightTheme => darkTheme; // For now, we only Lock In in Dark Mode
}