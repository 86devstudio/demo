import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../main.dart';
//import '../views/root_page.dart';
import '../views/pages/home_page.dart';
import '../views/pages/ui_test.dart';

class HomeRoute {
  //static const rootPath = '/';
  static const testPath = '/test';
  static const homePath = '/home';
  static const splashPath = '/splash';

  static final pages = [
    GetPage(name: splashPath, page: () => SplashScreen()),
    GetPage(name: testPath, page: () => UiTest()),
    GetPage(
      name: homePath,
      page: () => HomePage(),
      binding: BindingsBuilder(() {
        Get.put(AppController());
      }),
    ),
  ];
}
