import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatchHeader extends StatelessWidget {
  final bool isWide;

  const LiveMatchHeader({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 32 : 16,
        vertical: isWide ? 24 : 16,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          const Spacer(),
          const Text(
            'Live Match',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
