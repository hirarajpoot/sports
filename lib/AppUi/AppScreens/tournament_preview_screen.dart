import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/create_tournament_controller.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../AppScreens/TournamentPreview/widgets/bottom_info_box.dart';
import '../AppScreens/TournamentPreview/widgets/match_container.dart';
import '../AppScreens/TournamentPreview/widgets/app_bar.dart';
import '../AppScreens/TournamentPreview/widgets/start_button.dart';
import '../Controllers/auth-controllers/tournament_preview_controller.dart';

class TournamentPreviewScreen extends StatelessWidget {
  TournamentPreviewScreen({super.key});

  final createTournamentController = Get.find<CreateTournamentController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TournamentPreviewController(createTournamentController.selectedTeams),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundLayer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomAppBar(),
              const SizedBox(height: 24),
              Expanded(
                child: Obx(() => ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.matchups.length,
                      itemBuilder: (context, index) {
                        final match = controller.matchups[index];
                        return MatchContainer(
                          team1: match['team1']!,
                          team2: match['team2']!,
                          opacity: 1.0,
                        );
                      },
                    )),
              ),
              const SizedBox(height: 12),
              const BottomInfoBox(),
              const SizedBox(height: 16),
              StartButton(onPressed: controller.startTournament),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
