import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final Color? backgroundColor; // Added backgroundColor parameter

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.backgroundColor, // Added backgroundColor parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor, // Use backgroundColor for the container color
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
