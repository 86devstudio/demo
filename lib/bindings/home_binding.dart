import 'package:get/get.dart';
import '../controllers/app_controller.dart';
//import '../controllers/root_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<RootController>(RootController());
    Get.lazyPut(() => AppController());
  }
}
