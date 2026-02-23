import 'package:flutter/material.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String selectedGender = 'Male';
  final Color kTerminalBlack = const Color(0xFF0D0D0D);
  final Color kCardGrey = const Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTerminalBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Create Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE AVATAR SECTION
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: kCardGrey,
                  child: const Icon(Icons.person_outline, color: Colors.white54, size: 40),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DISPLAY NAME", style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1)),
                      TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: "Terminal User",
                          hintStyle: TextStyle(color: Colors.white24),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white10)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // DATE OF BIRTH
            _label("DATE OF BIRTH"),
            _terminalInput("dd/mm/yyyy", suffix: Icons.calendar_month),
            const SizedBox(height: 24),

            // PHYSICAL ATTRIBUTES (Weight & Height)
            _label("PHYSICAL ATTRIBUTES"),
            Row(
              children: [
                Expanded(child: _terminalInput("Weight (kg)")),
                const SizedBox(width: 16),
                Expanded(child: _terminalInput("Height (cm)")),
              ],
            ),
            const SizedBox(height: 24),

            // GENDER TOGGLE (IDENTITY PROTOCOL)
            _label("IDENTITY PROTOCOL"),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: kCardGrey, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  _genderBtn("Male"),
                  _genderBtn("Female"),
                ],
              ),
            ),
            const SizedBox(height: 60),

            // INITIALIZE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => debugPrint("Account Initialized"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Initialize Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text, style: const TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
      );

  Widget _terminalInput(String hint, {IconData? suffix}) => TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white24),
          filled: true,
          fillColor: kCardGrey,
          suffixIcon: suffix != null ? Icon(suffix, color: Colors.white54, size: 20) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Colors.white24)),
        ),
      );

  Widget _genderBtn(String type) {
    bool isSelected = selectedGender == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(type, style: TextStyle(color: isSelected ? Colors.white : Colors.white24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}