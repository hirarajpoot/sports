import 'package:get/get.dart';
import '../../Models/club_model.dart';

class ClubController extends GetxController {
  var selectedTab = 0.obs;

  var clubs = <Club>[
    Club(
      name: "Alpha FC",
      matchType: "friendly match",
      category: "Football",
      members: 45,
    ),
    Club(
      name: "Beta United",
      matchType: "friendly match",
      category: "Football",
      members: 45,
    ),
    Club(
      name: "Gamma Legends",
      matchType: "friendly match",
      category: "Pro",
      members: 20,
    ),
  ].obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void goToCreateClub() {
    selectTab(1);
    // Future: Navigate to Create Club Screen
  }
}
