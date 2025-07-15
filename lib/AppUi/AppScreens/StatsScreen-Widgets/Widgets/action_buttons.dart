import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  final bool isWide;
  const ActionButtons({super.key, required this.isWide});

  @override
  Widget build(BuildContext c) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _actionButton(
        title: "Start Match",
        onPressed: () => Get.toNamed('/match-setup'),
      ),
      _actionButton(
        title: "Start Tournament",
        onPressed: () => Get.toNamed('/start-tournament'), 
      ),
    ],
  );

  Widget _actionButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 148,
      height: 37,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A9A5D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
