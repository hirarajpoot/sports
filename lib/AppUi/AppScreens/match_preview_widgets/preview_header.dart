import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewHeader extends StatelessWidget {
  final bool isWide;

  const PreviewHeader({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        const Spacer(),
        Text(
          'Match Preview',
          style: TextStyle(
            fontSize: isWide ? 28 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
