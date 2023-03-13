import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import '../../values/palette.dart';
import '../../values/styletext.dart';


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
                  () => controller.isDark.value
                      ? Palette.darkMode
                      : Palette.liteMode,
                ),
              ),
            ),
          ],
        ),
        body: Center(
            child: Text(
          'Home Page',
          style: StyleText.headingStyle1,
        )));
  }
}
