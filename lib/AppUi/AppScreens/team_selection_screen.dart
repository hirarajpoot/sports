import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/team_selection_controller.dart';
import '../AppScreens/TeamSelection-Widgets/top_bar.dart';
import 'TeamSelection-Widgets/info_box.dart';
import '../AppScreens/TeamSelection-Widgets/select_club_switch.dart';
import '../AppScreens/TeamSelection-Widgets/team_card.dart';
import '../AppScreens/TeamSelection-Widgets/vs_circle.dart';

class TeamSelectionScreen extends StatelessWidget {
  TeamSelectionScreen({super.key});
  final controller = Get.put(TeamSelectionController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    double baseFont(double size) => size * mq.textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: TopBar(baseFont: baseFont),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset("assets/images/ground.png", fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 16),
                InfoBox(baseFont: baseFont),
                const SizedBox(height: 24),
                SelectClubSwitch(baseFont: baseFont, controller: controller),
                const SizedBox(height: 32),
                TeamCard(
                  baseFont: baseFont,
                  label: 'Team A',
                  onTap: controller.goToNextScreen,
                ),
                const SizedBox(height: 32),
                VsCircle(baseFont: baseFont),
                const SizedBox(height: 32),
                TeamCard(
                  baseFont: baseFont,
                  label: 'Team B',
                  onTap: controller.goToNextScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
