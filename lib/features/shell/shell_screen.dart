import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../chat/chat_screen.dart';
import '../settings/settings_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _selectedIndex = 0;

  // The screens we will navigate between
  final List<Widget> _screens = [
    const Center(child: Text("HOME (LIQUID BAR HERE)", style: TextStyle(fontSize: 20))),
    const Center(child: Text("SENSEI CHAT (GEMMA)", style: TextStyle(fontSize: 20))),
    const Center(child: Text("SETTINGS", style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}