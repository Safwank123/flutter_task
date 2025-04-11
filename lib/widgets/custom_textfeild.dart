import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller; // <-- Add this

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onSuffixTap,
    this.controller, // <-- Add this
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // <-- Use it here
      readOnly: true, // Optional: to prevent keyboard
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  prefixIconPath!,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              )
            : null,
        suffixIcon: suffixIconPath != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    suffixIconPath!,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : null,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
