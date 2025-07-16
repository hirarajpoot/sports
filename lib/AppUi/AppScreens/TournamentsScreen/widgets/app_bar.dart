import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final double Function(double) scale;

  const CustomAppBar({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(scale(100)),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + scale(12),
          left: scale(12),
          right: scale(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            ),
            Center(
              child: Text(
                'Tournaments',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: scale(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset(
                'assets/icons/blacklogo.png',
                width: scale(89),
                height: scale(89),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
