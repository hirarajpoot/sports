import 'package:get/get.dart';

class AddPlayersController extends GetxController {
  void goBack() => Get.back();

  void navigateToPhoneInput() {
    Get.toNamed('/match-start');
  }

  void navigateToContacts() {
    // Reserved for future action
  }
}
