import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isWide;
  const TopBar({super.key, required this.isWide});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext c) {
    final mq = MediaQuery.of(c);
    baseFont(size) => size * mq.textScaleFactor;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'Match setup',
        style: TextStyle(
          fontSize: baseFont(20),
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }
}
