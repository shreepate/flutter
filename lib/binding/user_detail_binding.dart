import 'package:demo/controller/controller.dart';
import 'package:get/get.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserDetailController>(UserDetailController(), permanent: false);
  }
}
