import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/tournament_preview_controller.dart';
import '../AppScreens/TournamentPreview/widgets/app_bar.dart';
import '../AppScreens/TournamentPreview/widgets/match_container.dart';
import '../AppScreens/TournamentPreview/widgets/bottom_info_box.dart';
import '../AppScreens/TournamentPreview/widgets/start_button.dart';

class TournamentPreviewScreen extends StatelessWidget {
  const TournamentPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TournamentPreviewController());
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? MediaQuery.of(context).size.width * 0.1 : 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 20),
                  MatchContainer(opacity: 0.90),
                  MatchContainer(opacity: 0.90),
                  MatchContainer(opacity: 0.70), // ✅ Lighter for background peek
                  MatchContainer(opacity: 0.90),
                  MatchContainer(opacity: 0.90),
                  MatchContainer(opacity: 0.90),
                  const SizedBox(height: 16),
                  const BottomInfoBox(),
                  const SizedBox(height: 24),
                  StartButton(onPressed: controller.startTournament),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
