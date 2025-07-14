import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/signup_controller.dart';

class SendOtpButton extends StatelessWidget {
  final SignupController controller;
  final TextEditingController phoneController;

  const SendOtpButton({
    super.key,
    required this.controller,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.isButtonGreen.value
              ? () {
                  controller.goToNextScreen();
                }
              : null, // 🔥 Disable if not green
          style: ElevatedButton.styleFrom(
            backgroundColor: controller.isButtonGreen.value
                ? Colors.green
                : const Color(0xFFABAFB3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "SEND OTP",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
