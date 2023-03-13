import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.lable,
    required this.onPressed,
  }) : super(key: key);

  final String lable;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff7AEBF2),
            Color(0xff9887FE),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: const Offset(10,10),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.15)
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(lable,style:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),),
      ),
    );

  }
}
