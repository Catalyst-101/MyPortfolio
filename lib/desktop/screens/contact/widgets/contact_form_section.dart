// ====================== FRONTEND: Contact Form UI ======================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/desktop/external_widgets/link.dart';

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  String? validateField(String label, String value, {bool optional = false}) {
    if (!optional && value.trim().isEmpty) {
      return "$label cannot be empty";
    }
    if (label == "Email" && value.isNotEmpty) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(value)) {
        return "Invalid email format";
      }
    }
    return null;
  }

  // ====================== BACKEND: Send data to Firebase ======================
  Future<void> _sendMessage() async {
    await FirebaseFirestore.instance.collection("messages").add({
      "name": _nameController.text,
      "email": _emailController.text,
      "phone": _phoneController.text,
      "subject": _subjectController.text,
      "message": _messageController.text,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }

  void _handleSubmit() async {
    String? error;
    error ??= validateField("Name", _nameController.text);
    error ??= validateField("Email", _emailController.text);
    error ??= validateField("Subject", _subjectController.text);
    error ??= validateField("Message", _messageController.text);

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    } else {
      await _sendMessage();

      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _subjectController.clear();
      _messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Message sent successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Widget customTF(String hint, Icon icon, bool isDigit,
      {TextEditingController? controller,
      bool optional = false,
      int maxLines = 1}) {
    return TextField(
      inputFormatters: [
        isDigit
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
      ],
      controller: controller,
      maxLines: maxLines,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: maxLines > 1
            ? Padding(
                padding: const EdgeInsets.only(top: 2, left: 15),
                child: Icon(icon.icon, color: Colors.white),
              )
            : icon,
        alignLabelWithHint: true,
        labelText: hint,
        labelStyle: const TextStyle(color: Colors.white54),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white54)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 65, horizontal: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Leave a Message..",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  customTF("Your Name", const Icon(Icons.person, color: Colors.white),
                      false, controller: _nameController),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: customTF("Email",
                            const Icon(Icons.email, color: Colors.white), false,
                            controller: _emailController),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: customTF("Phone (optional)",
                            const Icon(Icons.phone, color: Colors.white), true,
                            controller: _phoneController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  customTF("Subject", const Icon(Icons.subject, color: Colors.white),
                      false, controller: _subjectController),
                  const SizedBox(height: 10),
                  customTF("Message", const Icon(Icons.message, color: Colors.white),
                      false, controller: _messageController, maxLines: 5),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Send"),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Follow Me At",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          label: "Github",
                          onPressed: () {}),
                      _SocialIcon(
                          icon: FontAwesomeIcons.linkedinIn,
                          label: "LinkedIn",
                          onPressed: () {}),
                      _SocialIcon(
                          icon: FontAwesomeIcons.pinterest,
                          label: "Pinterest",
                          onPressed: () {}),
                      _SocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          label: "Instagram",
                          onPressed: () {}),
                      _SocialIcon(
                          icon: FontAwesomeIcons.facebook,
                          label: "Facebook",
                          onPressed: () {}),
                      _SocialIcon(
                          icon: FontAwesomeIcons.twitter,
                          label: "Twitter",
                          onPressed: () {}),
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialIcon(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Link(icon: icon, size: 30, color: Colors.white, onPressed: onPressed),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
