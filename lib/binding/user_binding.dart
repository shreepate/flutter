import 'package:demo/controller/controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: false);
  }
}
