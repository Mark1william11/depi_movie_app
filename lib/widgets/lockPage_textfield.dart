import 'package:flutter/material.dart';

class LockpageTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obsecureTxt;

  const LockpageTextfield({
    super.key,
    required this.controller,
    required this.obsecureTxt,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obsecureTxt,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.white60),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white12,
            filled: true),
      ),
    );
  }
}
