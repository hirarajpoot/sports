import 'package:get/get.dart';

class TeamSelectionController extends GetxController {
  RxBool isClubSelected = true.obs;

  void goToNextScreen() {
    Get.toNamed('/match-start');
  }
}
