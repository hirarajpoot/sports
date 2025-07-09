import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/verify_otp_controller.dart';
import '../../../../Utlies/routes/app_routes.dart';

class VerifyOtpButton extends StatelessWidget {
  final VerifyOtpController controller;

  VerifyOtpButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              String enteredOtp =
                  controller.otpDigits.map((e) => e.value).join();

              if (enteredOtp.length < 4) {
                // 🔥 Invalid OTP Alert
                Get.snackbar(
                  "Invalid OTP",
                  "Please enter the 4-digit OTP.",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.shade600,
                  colorText: Colors.white,
                );

                // 🔥 Start Resend Timer
                if (!controller.isTimerRunning.value) {
                  controller.startResendTimer();
                }
              } else {
                controller.isButtonGreen.value = true;

                // ✅ Navigate to Complete Profile
                Get.offAllNamed(AppRoutes.completeProfile);
              }
            },
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
        ));
  }
}
