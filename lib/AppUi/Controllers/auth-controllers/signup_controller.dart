import 'package:get/get.dart';

class SignupController extends GetxController {
  var isWhatsappChecked = false.obs;
  var isButtonGreen = false.obs;

  void toggleWhatsapp(bool? value) {
    isWhatsappChecked.value = value ?? false;
  }

  void goToNextScreen() {
    Get.toNamed('/verify-otp'); 
  }
}
