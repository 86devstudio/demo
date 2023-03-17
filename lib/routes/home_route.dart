
import 'package:demo/views/pages/todo/widget/todo_edit.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/todo_controller.dart';
import '../main.dart';
//import '../views/root_page.dart';
import '../views/pages/home/home_page.dart';
import '../views/pages/todo/todo_page.dart';
import '../views/pages/todo/widget/todo_add.dart';
import '../views/pages/ui_test.dart';

class HomeRoute {
  //static const rootPath = '/';
  static const testPath = '/test';
  static const homePath = '/home';
  static const splashPath = '/splash';
  static const todoPath = '/todo';
  static const todoAddPath = '/todoAdd';
  static const todoEditPath = '/todoEdit';

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
    GetPage(
      name: todoPath,
      page: () => TodoPage(),
      binding: BindingsBuilder(() {
        Get.put(TodoController());
      }),
    ),
    GetPage(name: todoAddPath,
      page: () => TodoAdd(),
      transition: Transition.zoom,
    ),
    GetPage(name: todoEditPath,
      page: () => TodoEdit(),
      transition: Transition.zoom,
    ),
  ];
}
