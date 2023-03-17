import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/root_controller.dart';
import 'home/home_page.dart';

class RootPage extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => _onBackPressed(context),
          child: Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.redAccent,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              items: [
                _bottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  _onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("앱을 종료할까요?"),
        actions: <Widget>[
          TextButton(
            child: Text("예 종료합니다."),
            onPressed: () {
              Get.back();
              exit(0);
            },
          ),
          TextButton(
            child: Text("아니오"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
