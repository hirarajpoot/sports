import 'package:flutter/material.dart';
import '../../../../Controllers/auth-controllers/verify_otp_controller.dart';
import 'package:get/get.dart';

class ResendOtpTimer extends StatelessWidget {
  final VerifyOtpController controller;

  const ResendOtpTimer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Text(
            controller.timerText,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Inter',
              fontSize: 12,
            ),
          ),
        ));
  }
}
