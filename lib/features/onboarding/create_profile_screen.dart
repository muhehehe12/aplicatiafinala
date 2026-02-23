import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String selectedGender = 'Male';
  final Color kTerminalBlack = const Color(0xFF0D0D0D);
  final Color kCardGrey = const Color(0xFF1A1A1A);
  
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

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
        title: const Text("Create Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE AVATAR SECTION
            Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: kCardGrey,
                    backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null 
                        ? const Icon(Icons.add, color: Colors.white54, size: 30)
                        : null,
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DISPLAY NAME",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 10,
                              letterSpacing: 1)),
                      TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: "User", 
                          hintStyle: TextStyle(color: Colors.white24),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white10)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
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
            _terminalInput(
              "DD / MM / YYYY",
              keyboard: TextInputType.number,
              formatters: [
                DateTextFormatter(),
                LengthLimitingTextInputFormatter(14),
              ],
            ),
            const SizedBox(height: 24),

            // PHYSICAL ATTRIBUTES
            _label("PHYSICAL ATTRIBUTES"),
            Row(
              children: [
                Expanded(
                    child: _terminalInput("Weight (kg)",
                        keyboard: TextInputType.number)),
                const SizedBox(width: 16),
                Expanded(
                    child: _terminalInput("Height (cm)",
                        keyboard: TextInputType.number)),
              ],
            ),
            const SizedBox(height: 24),

            // GENDER TOGGLE (ANIMATED)
            _label("IDENTITY PROTOCOL"),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: kCardGrey, borderRadius: BorderRadius.circular(16)),
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
                child: const Text("Initialize Account",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1)),
      );

  Widget _terminalInput(String hint,
          {TextInputType? keyboard, List<TextInputFormatter>? formatters}) =>
      TextField(
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboard,
        inputFormatters: formatters,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white24),
          filled: true,
          fillColor: kCardGrey,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white24)),
        ),
      );

  // UPDATED: Now supports animation
  Widget _genderBtn(String type) {
    bool isSelected = selectedGender == type;
    
    // Exact colors requested
    Color activeColor = type == 'Male' ? const Color(0xFF6666FF) : const Color(0xFFFF66FF);

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = type),
        child: AnimatedContainer(
          // 1. Define the duration of the transition
          duration: const Duration(milliseconds: 300), 
          // 2. Define the curve for smoothness
          curve: Curves.easeInOut,
          
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          
          // 3. Animate the text color as well
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.white24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Ensure font consistency
                fontSize: 14),
            child: Text(type),
          ),
        ),
      ),
    );
  }
}

/// A "Safe" Formatter that handles digit-only filtering AND auto-slashes
class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final newString = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 4) newString.write(' / ');
      newString.write(text[i]);
    }
    return TextEditingValue(
      text: newString.toString(),
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}