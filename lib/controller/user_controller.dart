import 'package:demo/data/db_provider.dart';
import 'package:demo/model/model.dart';
import 'package:demo/service/service.dart';
import 'package:demo/util/common.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxList<CourseDataModel> courseList = RxList.empty();
  RxBool isLoading = false.obs;

  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    super.onInit();
    getCourses();
  }

  getCourses() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      try {
        isLoading.value = true;
        await DataBaseHelper.db.deleteAll();
        await RemoteServices.getCourse();
        var response = await RemoteServices.getCourse();
        if (response.data != null) {
          isLoading.value = false;
          (response.data as List).map((courses) {
            DataBaseHelper.db.createCourse(CourseDataModel.fromJson(courses));
          }).toList();
        } else {
          isLoading.value = false;
        }
        courseList.value = await DataBaseHelper.db.getCourseList();
      } catch (e) {
        isLoading.value = false;
      }
    }
  }
}
