import 'package:demo/binding/binding.dart';
import 'package:demo/view/user/user_screen.dart';
import 'package:demo/view/user_detail/user_detail_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.USERLIST;

  static final routes = [
    GetPage(
      name: Routes.USERLIST,
      page: () => const UserScreen(),
      transition: Transition.leftToRight,
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.USERDETAIL,
      page: () => UserDetailScreen(),
      transition: Transition.leftToRight,
      binding: UserBinding(),
    ),
  ];
}
