import 'package:demo/controller/controller.dart';
import 'package:demo/routes/app_routes.dart';
import 'package:demo/util/string_date_extension.dart';
import 'package:demo/view/user/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CommonAppBar(title: 'User List'),
          body: controller.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : userListUI(),
        ));
  }

  Widget userListUI() {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black12,
      ),
      itemCount: controller.courseList.length,
      itemBuilder: (BuildContext context, int index) {
        var list = controller.courseList;
        return ListTile(
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
          title: Text(
            list[index].coreSerial.toString(),
            style: const TextStyle(color: Colors.cyan),
          ),
          trailing: Text(StringDateExtension.displayTimeAgoFromTimestamp(
              list[index].originalLaunch.toString())),
          onTap: () {
            Get.toNamed(Routes.USERDETAIL,
                arguments: list[index]);
          },
        );
      },
    );
  }
}
