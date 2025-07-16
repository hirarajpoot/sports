import 'dart:async';
import 'package:get/get.dart';
import '../../Utlies/routes/app_routes.dart';
import 'package:flutter/material.dart';

class VerifyOtpController extends GetxController {
  final List<RxString> otpDigits = List.generate(4, (_) => ''.obs);
  var isButtonGreen = false.obs;

  var resendSeconds = 40.obs;
  var isTimerRunning = false.obs;

  String get timerText {
    return isTimerRunning.value
        ? "Resend OTP in ${resendSeconds.value}s"
        : "Resend OTP";
  }

  void onOtpChanged(int index, String value) {
    otpDigits[index].value = value;
    checkOtpCompletion();
  }

  void checkOtpCompletion() {
    bool allFilled = otpDigits.every((digit) => digit.value.isNotEmpty);
    isButtonGreen.value = allFilled;
  }

  void verifyOtp() {
    String enteredOtp = otpDigits.map((e) => e.value).join();

    if (enteredOtp.length < 4) {
      Get.snackbar(
        "Invalid OTP",
        "Please enter the 4-digit OTP.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
      );

      if (!isTimerRunning.value) {
        startResendTimer();
      }
    } else {
      // TODO: Add API call here if needed
      Get.offAllNamed(AppRoutes.completeProfile);
    }
  }

  void startResendTimer() {
    isTimerRunning.value = true;
    resendSeconds.value = 40;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value > 0) {
        resendSeconds.value--;
      } else {
        timer.cancel();
        isTimerRunning.value = false;
      }
    });
  }
}
