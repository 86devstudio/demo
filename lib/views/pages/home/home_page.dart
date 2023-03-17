import 'package:demo/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../values/palette.dart';
import '../../../values/styletext.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page', style: StyleText.appBarTitleStyle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () => controller.changeTheme(),
              child: Obx(
                    () => controller.isDark.value ? Palette.darkMode : Palette.liteMode,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(HomeRoute.todoPath);
              },
              style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.black,
                  // foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10),
                  )
              ),
              child: const Text('TODO'),
            ),
        ),
      ),
    );
  }
}
