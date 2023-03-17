import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar({Key? key, this.title}) : super(key: key);

  final String? title;
  final AppBar _appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black12,
      title: Text(
        title ?? '',
      ),
      centerTitle: true,
      leading: SizedBox(
        child: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
            // Get.back();
          },
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.8),
          child: Divider(
            height: 0,
            thickness: 2,
            color: Colors.grey.withOpacity(0.15),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBar.preferredSize.height);
}
