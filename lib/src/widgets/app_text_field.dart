import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
