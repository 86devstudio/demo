import 'package:get/get.dart';

class RootController extends GetxController {
  var tabIndex = 0;
  var currentIndex = 0;

  void changeTabIndex(int index) {
    currentIndex = index;
    tabIndex = index;
    update();
  }
}
