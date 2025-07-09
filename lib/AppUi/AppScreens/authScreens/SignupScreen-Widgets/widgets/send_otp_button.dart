import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/signup_controller.dart';

class SendOtpButton extends StatelessWidget {
  final SignupController controller;
  final TextEditingController phoneController;

  const SendOtpButton({super.key, required this.controller, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              String phone = phoneController.text.trim();
              if (phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone)) {
                controller.isButtonGreen.value = true;
                controller.goToNextScreen();
              } else {
                Get.snackbar(
                  "Invalid Number",
                  "Please enter a valid 10-digit mobile number",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.shade600,
                  colorText: Colors.white,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.isButtonGreen.value
                  ? Colors.green
                  : Color(0xFFABAFB3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "SEND OTP",
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
