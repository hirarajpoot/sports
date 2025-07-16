import 'package:get/get.dart';
import '../../models/player_stats_model.dart';

class StatsController extends GetxController {
  var selectedPosition = 'Midfielder'.obs;
  var currentTab = 0.obs;

  // Player Stats Model
  var playerStats = PlayerStats(
    name: "Akshay",
    position: "Midfielder",
    profileImage: "assets/images/Ellipse 64.png",
    matchesPlayed: 600,
    goalsScored: 400,
    defendersScore: "42 pts",
  ).obs;

  void changePosition(String position) {
    selectedPosition.value = position;
    playerStats.update((p) {
      if (p != null) p.position = position;
    });
  }

  void changeTab(int tabIndex) {
    currentTab.value = tabIndex;
  }

  void findSponsors() {
    // TODO: Add navigation or API call
    Get.toNamed('/find-sponsors');
  }

  void startMatch() {
    Get.toNamed('/match-setup');
  }

  void startTournament() {
    Get.toNamed('/create-tournament');
  }
}
