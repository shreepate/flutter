import 'package:demo/model/model.dart';
import 'package:get/get.dart';

class UserDetailController extends GetxController {
  CourseDataModel? courseData;

  @override
  void onInit() {
    courseData = Get.arguments;
    super.onInit();
  }

}
