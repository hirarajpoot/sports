import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final double Function(double) baseFont;
  const TopBar({super.key, required this.baseFont});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext c) => AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87),
      onPressed: () => Get.back(),
    ),
    title: Text(
      'Select Teams',
      style: TextStyle(
        fontSize: baseFont(18),
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
    centerTitle: true,
  );
}
