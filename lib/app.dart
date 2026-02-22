import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_controller.dart';
import 'features/onboarding/intro_screen.dart';

class MonkWarriorApp extends StatelessWidget {
  const MonkWarriorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This allows the app to switch themes dynamically
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp(
      title: 'Monk Warrior',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      // START AT INTRO
      home: const IntroScreen(),
      
      builder: (context, child) {
        return MediaQuery(
          // Using textScaleFactor for your specific Flutter version
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }, // Closing builder
    ); // Closing MaterialApp
  } // Closing build method
} // Closing MonkWarriorApp class