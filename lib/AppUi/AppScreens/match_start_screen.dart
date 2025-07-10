import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/match_start_controller.dart';
import 'AddPlayersScreen-Widgets/widgets/background_layer.dart';
import 'TeamSelection-Widgets/info_box.dart';
import 'MatchStartScreen-Widgets/team_circle.dart';
import 'MatchStartScreen-Widgets/vs_circle.dart';
import 'MatchStartScreen-Widgets/change_button.dart';

class MatchStartScreen extends StatelessWidget {
  const MatchStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(MatchStartController());
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 600;
    double baseFont(double size) => size * mq.textScaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 30 : 14,
                vertical: isWide ? 20 : 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      const Spacer(),
                      Text(
                        'Select Teams',
                        style: TextStyle(
                          fontSize: isWide ? 30 : 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 50),
                  InfoBox(baseFont: baseFont),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      TeamCircle(name: 'Team Shivaay'),
                      VsCircle(),
                      TeamCircle(name: 'Team Shivaay'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChangeButton(
                        onTap: cont.changeTeamA,
                        text: 'Change Team A',
                      ),
                      ChangeButton(
                        onTap: cont.changeTeamB,
                        text: 'Change Team B',
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: cont.startMatch,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A9A5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Image.asset(
              'assets/images/football.png',
              height: isWide ? 24 : 20,
            ),
            label: Text(
              'Start Match',
              style: TextStyle(
                fontSize: isWide ? 18 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
