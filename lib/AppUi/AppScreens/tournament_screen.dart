import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/tournaments_controller.dart';
import '../AppScreens/TournamentsScreen/widgets/app_bar.dart';
import '../AppScreens/TournamentsScreen/widgets/tabs.dart';
import '../AppScreens/TournamentsScreen/widgets/match_card.dart';
import '../AppScreens/TournamentsScreen/widgets/leaderboard_table.dart';
import '../AppScreens/TournamentsScreen/widgets/points_table.dart';

class TournamentsScreen extends StatelessWidget {
  final TournamentsController controller = Get.put(TournamentsController());

   TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    double scale(double px) => px / 375 * w;

    return Scaffold(
      body: BackgroundLayer(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(scale: scale),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: scale(14)),
                  child: Column(
                    children: [
                      SizedBox(height: scale(16)),
                      Tabs(scale: scale, controller: controller),
                      SizedBox(height: scale(16)),
                      Obx(() {
                        if (controller.selectedTab.value == 0) {
                          return Column(
                            children: [
                              MatchCard(
                                // scale: scale,
                                label: 'UPCOMING',
                                teamA: 'Alpha',
                                teamB: 'Beta',
                                imgA: 'alpha.png',
                                imgB: 'beta.png',
                                time: 'Today, 7:00 PM',
                              ),
                              MatchCard(
                                // scale: scale,
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
                              MatchCard(
                                // scale: scale,
                                label: 'COMPLETED',
                                teamA: 'Epsilon',
                                teamB: 'Zeta',
                                imgA: 'alpha.png',
                                imgB: 'beta.png',
                                time: 'Yesterday, 9:00 PM',
                                scoreA: '3',
                                scoreB: '0',
                              ),
                            ],
                          );
                        } else if (controller.selectedTab.value == 1) {
                          return LeaderboardTable(scale: scale);
                        } else {
                          return PointsTable(scale: scale);
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
