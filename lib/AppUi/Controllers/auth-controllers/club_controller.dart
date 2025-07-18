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
      imagePath: 'assets/images/default.png',
      about: 'Top tier football club.',
    ),
    Club(
      name: "Beta United",
      matchType: "friendly match",
      category: "Football",
      members: 45,
      imagePath: 'assets/images/default.png',
      about: 'Community football team.',
    ),
    Club(
      name: "Gamma Legends",
      matchType: "friendly match",
      category: "Pro",
      members: 20,
      imagePath: 'assets/images/default.png',
      about: 'Legends of the league.',
    ),
  ].obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void goToCreateClub() {
    Get.back(); 
    Get.toNamed('/create-club'); 
  }
}
