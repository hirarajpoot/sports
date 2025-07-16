import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/verify_otp_controller.dart';

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController controller = Get.find();

    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.isButtonGreen.value
              ? controller.verifyOtp
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: controller.isButtonGreen.value
                ? Colors.green
                : const Color(0xFFABAFB3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "VERIFY OTP",
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
