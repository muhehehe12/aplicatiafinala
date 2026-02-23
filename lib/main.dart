import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// This is now USED because we call IntroScreen() below
import 'package:aplicatiafinala/features/onboarding/intro_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Make the status bar look clean
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monk Warrior',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // Using the ColorScheme correctly
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, 
          brightness: Brightness.dark
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      // --- THE CONNECTION ---
      // We point 'home' to your friend's IntroScreen
      home: const IntroScreen(), 
    );
  }
}