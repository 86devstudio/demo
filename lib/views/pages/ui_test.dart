import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class UiTest extends StatelessWidget {
  const UiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PixelPerfect(
      assetPath: 'assets/screens/login_page.png',
      scale: 0.94,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //상단 콘테이너
              Container(
                  width: double.infinity,
                  height: 260.0,
                  color: Colors.red,
                ),
              //중단 콘테이너1
              Container(
                width: double.infinity,
                height: 300.0,
                color: Colors.yellow,
              ),
              //중단 콘테이너2
              Container(
                width: double.infinity,
                height: 180.0,
                color: Colors.blue,
              ),
              //하단 콘테이너
              Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
