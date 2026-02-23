import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- LAYER 1: THE VIDEO BACKGROUND ---
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Center(
              child: Text(
                "*** Video Background Layer ***",
                style: TextStyle(color: Colors.white.withOpacity(0.3)),
              ),
            ),
          ),

          // --- LAYER 2: DARK OVERLAY ---
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // --- LAYER 3: THE UI CONTENT ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // Top Title
                  const Text(
                    "Welcome to (app)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  const Spacer(), 

                  // Bottom Section
                  Column(
                    children: [
                      Text(
                        "( App name ) is ready to build your 2026 version.\nJust 1 more step.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // --- THE CENTERED BUTTON ---
                      SizedBox(
                        width: double.infinity, // Makes the button span the width evenly
                        child: ElevatedButton(
                          onPressed: () => debugPrint("Create profile"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Create profile", 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Terms of Service
                      TextButton(
                        onPressed: () => debugPrint("Terms"),
                        child: const Text(
                          "Terms of service",
                          style: TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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