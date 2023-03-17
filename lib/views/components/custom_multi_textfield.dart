import 'package:flutter/material.dart';

class CustomMultiTextField extends StatelessWidget {
  CustomMultiTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 5,
    this.focusNode,
    required this.color,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final int maxLines;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      maxLines: maxLines,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 14,
              color: color),
          contentPadding: const EdgeInsets.all(10)),
    );
  }
}
