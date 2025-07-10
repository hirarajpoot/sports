import 'package:get/get.dart';

class MatchPreviewController extends GetxController {
  var score1 = 0.obs;
  var score2 = 0.obs;
  var status = 'Toss Winner – Kicks Off First'.obs;
  var players = '5v5'.obs;
  var ground = 'Turf'.obs;
  var duration = '10 min'.obs;
  var isReady = false.obs;

  void onScore1Changed(int val) => score1(val);
  void onScore2Changed(int val) => score2(val);

  void onReadyTapped() {
    if (!isReady.value) {
      isReady(true);
    } else {
      Get.toNamed('/live-match'); 
    }
  }
}
