import 'package:get/get.dart';
// import 'package:sports/AppUi/Utlies/routes/app_routes.dart';
import '../../Models/tournament_match_model.dart';

class TournamentsController extends GetxController {
  RxInt selectedTab = 0.obs;

  final List<TournamentMatchModel> matchesData = [
    TournamentMatchModel(
      label: 'UPCOMING',
      teamA: 'Alpha',
      teamB: 'Beta',
      imgA: 'alpha.png',
      imgB: 'beta.png',
      time: 'Today, 7:00 PM',
    ),
    TournamentMatchModel(
      label: 'LIVE',
      teamA: 'Gamma',
      teamB: 'Delta',
      imgA: 'gamma.png',
      imgB: 'beta.png',
      time: 'Half-time',
      scoreA: '2',
      scoreB: '1',
      isLive: true,
    ),
    TournamentMatchModel(
      label: 'COMPLETED',
      teamA: 'Epsilon',
      teamB: 'Zeta',
      imgA: 'alpha.png',
      imgB: 'beta.png',
      time: 'Yesterday, 9:00 PM',
      scoreA: '3',
      scoreB: '0',
    ),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  // void navigateToChallengeScreen(TournamentMatchModel match) {
  //   Get.toNamed(AppRoutes.addPlayers, arguments: match);
  // }
}
