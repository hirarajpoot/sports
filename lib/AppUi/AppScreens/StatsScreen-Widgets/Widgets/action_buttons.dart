import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  final bool isWide;
  const ActionButtons({super.key, required this.isWide});
  @override
  Widget build(BuildContext c) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A9A5D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 24 : 20,
            vertical: 12,
          ),
        ),
        onPressed: () => Get.toNamed('/match-setup'),
        child: Text(
          "Start Match",
          style: TextStyle(
            fontSize: isWide ? 16 : 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF11CE07),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 24 : 20,
            vertical: 12,
          ),
        ),
        onPressed: () {},
        child: Text(
          "Start Tournament",
          style: TextStyle(
            fontSize: isWide ? 16 : 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
