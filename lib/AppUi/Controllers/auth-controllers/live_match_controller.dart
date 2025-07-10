import 'package:get/get.dart';
import '../../AppScreens/LiveMatchScreen-Widgets/warning_dialog.dart';

class LiveMatchController extends GetxController {
  var score1 = 0.obs;
  var score2 = 0.obs;

  void incrementScore1() => score1.value++;
  void decrementScore1() {
    if (score1.value > 0) score1.value--;
  }

  void incrementScore2() => score2.value++;
  void decrementScore2() {
    if (score2.value > 0) score2.value--;
  }

  void showEndMatchDialog() {
    Get.dialog(const WarningDialog(), barrierDismissible: false);
  }

  void endMatch() {
    Get.back(); // Close dialog
    Get.toNamed('/match-summary'); // ✅ Navigate to next screen
  }
}
