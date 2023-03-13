import 'package:flutter/material.dart';

class CustomSingleTextField extends StatelessWidget {
  CustomSingleTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.focusNode,
    required this.prefixIcon,
    required this.color,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final int maxLines;
  final Icon prefixIcon;
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
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
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
