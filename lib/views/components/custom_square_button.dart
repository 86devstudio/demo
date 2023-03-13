import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({ required this.lable, required this.icon, required this.color, required this.width, required this.height, required this.onPressed}) : super();

  final String lable;
  final Icon icon;
  final Color color;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: color,
          ),
        ),
        child: Column(
          children: [
            icon,
            Expanded(
              child: Text(
                lable,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
