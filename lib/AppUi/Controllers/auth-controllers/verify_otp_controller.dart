import 'dart:async';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final List<RxString> otpDigits = List.generate(4, (_) => ''.obs);
  var isOtpComplete = false.obs;
  var isButtonGreen = false.obs;

  var resendSeconds = 40.obs;
  var isTimerRunning = false.obs;

  String get timerText {
    if (isTimerRunning.value) {
      return "Resend OTP in ${resendSeconds.value}s";
    } else {
      return "Resend OTP";
    }
  }

  void checkOtpCompletion() {
    isOtpComplete.value =
        otpDigits.every((digit) => digit.value.isNotEmpty);
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
