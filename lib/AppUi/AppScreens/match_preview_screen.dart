import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/match_preview_controller.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import 'match_preview_widgets/preview_header.dart';
import 'match_preview_widgets/preview_container.dart';
import 'match_preview_widgets/ready_status_card.dart';
import 'match_preview_widgets/info_card_fixed.dart';

class MatchPreviewScreen extends StatelessWidget {
  const MatchPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(MatchPreviewController());
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
                horizontal: isWide ? 32 : 16,
                vertical: isWide ? 24 : 16,
              ),
              child: Column(
                children: [
                  PreviewHeader(isWide: isWide),
                  const SizedBox(height: 24),
                  PreviewContainer(
                    ctrl: ctrl,
                    isWide: isWide,
                    baseFont: baseFont,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoCardFixed('Players', ctrl.players.value, baseFont),
                      InfoCardFixed('Ground', ctrl.ground.value, baseFont),
                      InfoCardFixed('Duration', ctrl.duration.value, baseFont),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ReadyStatusCard(ctrl: ctrl, baseFont: baseFont),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          width: 350,
          height: 56,
          child: Obx(
            () => ElevatedButton(
              onPressed: ctrl.onReadyTapped,
              style: ElevatedButton.styleFrom(
                backgroundColor: ctrl.isReady.value
                    ? const Color(0xFF28A745) 
                    : const Color(0xFF1A9A5D), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/football.png',
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ctrl.isReady.value ? 'Starting...' : 'Start Match',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
