import 'package:flutter/material.dart';
import '../../controllers/app_controller.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    Key? key,
    required this.onChanged,
    required this.color,
  }) : super(key: key);
  final Function(String) onChanged;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String val) {
        onChanged(val);
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: color,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14, color: color),
          contentPadding: const EdgeInsets.all(10)),
    );
  }
}
