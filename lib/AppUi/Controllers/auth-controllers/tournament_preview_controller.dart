import 'package:get/get.dart';

class TournamentPreviewController extends GetxController {
  final List<String> selectedTeams;
  final RxList<Map<String, String>> matchups = <Map<String, String>>[].obs;

  TournamentPreviewController(this.selectedTeams);

  @override
  void onInit() {
    super.onInit();
    generateMatchups();
  }

  void generateMatchups() {
    matchups.clear();
    for (int i = 0; i < selectedTeams.length - 1; i++) {
      matchups.add({
        'team1': selectedTeams[i],
        'team2': selectedTeams[i + 1],
      });
    }
  }

  void startTournament() {
    Get.toNamed('/tournament-screen');
  }
}
