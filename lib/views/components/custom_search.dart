import 'package:flutter/material.dart';
import '../../controllers/app_controller.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    Key? key,
    required this.controller,
    required this.color,
  }) : super(key: key);
  final AppController controller;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String val) {
        //controller.search(val);
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
