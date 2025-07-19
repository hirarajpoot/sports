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
    for (int i = 0; i + 1 < selectedTeams.length; i += 2) {
      matchups.add({'team1': selectedTeams[i], 'team2': selectedTeams[i + 1]});
    }
  }

  void startTournament() {
    // Get.toNamed('/challenge-screen');
  }
}
