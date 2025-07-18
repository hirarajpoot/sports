import 'package:get/get.dart';

class ClubDetailsController extends GetxController {
  var currentIndex = 0.obs;
  void selectTab(int i) => currentIndex.value = i;
}
