import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
    if (index == 0) {
      Get.toNamed('/stats');
    }
  }
}
