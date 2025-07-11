import 'package:get/get.dart';

class MatchSummaryController extends GetxController {
  var team1Score = 4.obs;
  var team2Score = 7.obs;
  var manOfTheMatch = 'TEAM 1'.obs;
  var position = 'Midfielder'.obs;

  final goalScorers = [
    {
      'minute': '1’',
      'position': 'Midfielder',
      'team': 'Team 1',
      'name': 'Mike Smith',
    },
    {
      'minute': '1’',
      'position': 'Defender',
      'team': 'Team 1',
      'name': 'Alex Johnson',
    },
  ].obs;

  void navigateToNextScreen() {
    Get.toNamed('/leaderboard'); 
  }
}
