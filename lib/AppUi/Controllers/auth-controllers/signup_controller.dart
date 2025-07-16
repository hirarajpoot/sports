import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isWhatsappChecked = false.obs;
  var isButtonGreen = false.obs;

  final TextEditingController phoneController = TextEditingController();

  void toggleWhatsapp(bool? value) {
    isWhatsappChecked.value = value ?? false;
  }

  void onPhoneChanged(String value) {
    // ✅ Validate phone number and enable button
    if (value.length == 10 && RegExp(r'^[0-9]+$').hasMatch(value)) {
      isButtonGreen.value = true;
    } else {
      isButtonGreen.value = false;
    }
  }

  void goToNextScreen() {
    Get.offNamed('/verify-otp');
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
