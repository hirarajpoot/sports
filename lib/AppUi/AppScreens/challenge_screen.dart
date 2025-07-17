import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/challenge_controller.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../AppScreens/ChallengeScreen/widgets/challenge_app_bar.dart';
import '../AppScreens/ChallengeScreen/widgets/challenge_explore_card.dart';
import '../AppScreens/ChallengeScreen/widgets/challenge_request_card.dart';
import '../AppScreens/ChallengeScreen/widgets/challenge_tabs.dart';
import '../AppScreens/ChallengeScreen/widgets/challenge_tournament_card.dart';

class ChallengeScreen extends StatelessWidget {
  final ChallengeController controller = Get.put(ChallengeController());

  ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChallengeAppBar(),
                ChallengeTabs(controller: controller),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() {
                    String heading = '';
                    Widget listWidget;

                    if (controller.selectedTab.value == 0) {
                      heading = 'Challenge Requests';
                      listWidget = ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.challengeRequests.length,
                        itemBuilder: (_, index) {
                          return ChallengeRequestCard(
                            request: controller.challengeRequests[index],
                            controller: controller,
                          );
                        },
                      );
                    } else if (controller.selectedTab.value == 1) {
                      heading = 'Nearby Clubs';
                      listWidget = ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.nearbyClubs.length,
                        itemBuilder: (_, index) {
                          return ChallengeExploreCard(
                            club: controller.nearbyClubs[index],
                          );
                        },
                      );
                    } else {
                      heading = 'Tournament Invitations';
                      listWidget = ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.tournamentInvites.length,
                        itemBuilder: (_, index) {
                          return ChallengeTournamentCard(
                            tournament: controller.tournamentInvites[index],
                            controller: controller,
                          );
                        },
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            heading,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              height: 50.31 / 22,
                              letterSpacing: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(child: listWidget),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
