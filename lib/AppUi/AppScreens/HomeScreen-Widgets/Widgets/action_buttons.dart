import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _homeButton('Match', () {}, isMatch: true),
        const SizedBox(width: 8),
        _homeButton('Tournament', () => Get.toNamed('/tournament-screen')),
        const SizedBox(width: 8),
        _homeButton('Find Sponsors', () {}),
      ],
    );
  }

  Widget _homeButton(String title, VoidCallback onTap, {bool isMatch = false}) {
    return Expanded(
      child: SizedBox(
        height: 41,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E8A57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                fontSize: isMatch ? 10 : 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
