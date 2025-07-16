import 'package:get/get.dart';

class TournamentsController extends GetxController {
  RxInt selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
