import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isWhatsappChecked = false.obs;
  var isButtonGreen = false.obs;

  final TextEditingController phoneController = TextEditingController();

  void toggleWhatsapp(bool? value) {
    isWhatsappChecked.value = value ?? false;
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
