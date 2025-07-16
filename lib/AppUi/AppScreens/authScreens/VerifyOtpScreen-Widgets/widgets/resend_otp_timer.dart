import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/verify_otp_controller.dart';

class ResendOtpTimer extends StatelessWidget {
  const ResendOtpTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController controller = Get.find();

    return Obx(() => Center(
          child: Text(
            controller.timerText,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Inter',
              fontSize: 12,
            ),
          ),
        ));
  }
}
