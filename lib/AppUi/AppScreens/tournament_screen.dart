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
                            children: controller.matchesData.map((match) {
                              return MatchCard(match: match);
                            }).toList(),
                          );
                        } else if (controller.selectedTab.value == 1) {
                          return LeaderboardTable(
                            scale: scale,
                            leaderboard: [
                              {'rankPoints': 24, 'team': 'Team Alpha', 'won': 8},
                              {'rankPoints': 20, 'team': 'Team Beta', 'won': 6},
                              {'rankPoints': 18, 'team': 'Team Gamma', 'won': 5},
                            ],
                          );
                        } else {
                          return PointsTable(
                            scale: scale,
                            pointsTable: [
                              {'team': 'Team Alpha', 'played': 10, 'won': 8, 'lost': 2, 'gf': 25},
                              {'team': 'Team Beta', 'played': 10, 'won': 7, 'lost': 3, 'gf': 22},
                              {'team': 'Team Gamma', 'played': 10, 'won': 6, 'lost': 4, 'gf': 18},
                            ],
                          );
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
