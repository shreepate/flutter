import 'package:demo/controller/controller.dart';
import 'package:demo/view/user/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailScreen extends GetView<UserDetailController> {
  UserDetailScreen({super.key});

  @override
  final controller = Get.put(UserDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'User Detail'),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    controller.courseData?.coreSerial ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(controller.courseData?.details ?? ''),
                ],
              ),
            ),
          ],
        ));
  }
}
