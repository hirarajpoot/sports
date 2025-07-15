import 'package:flutter/material.dart';
import '../../../../Controllers/auth-controllers/complete_profile_controller.dart';

class DoneButton extends StatelessWidget {
  final CompleteProfileController controller;

  const DoneButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15), // ✅ Bottom spacing = 15px
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.goToNextScreen,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A9A5D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Done",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
