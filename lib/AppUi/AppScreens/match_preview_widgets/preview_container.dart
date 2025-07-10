import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/match_preview_controller.dart';
import 'team_with_score_widget.dart';
import 'vs_circle.dart';

class PreviewContainer extends StatelessWidget {
  final MatchPreviewController ctrl;
  final bool isWide;
  final double Function(double) baseFont;

  const PreviewContainer({
    super.key,
    required this.ctrl,
    required this.isWide,
    required this.baseFont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 349,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(77, 173, 173, 253),
            Color.fromARGB(77, 253, 195, 195),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TeamWithScoreWidget(
                name: 'Team 1',
                score: ctrl.score1.value,
                borderColor: const Color(0xFF28EF81),
                onChanged: ctrl.onScore1Changed,
              ),
              VsCircle(isWide: isWide),
              TeamWithScoreWidget(
                name: 'Team 2',
                score: ctrl.score2.value,
                borderColor: const Color(0xFFFF0000),
                onChanged: ctrl.onScore2Changed,
              ),
            ],
          ),
          Obx(
            () => Text(
              ctrl.status.value,
              style: TextStyle(
                fontSize: baseFont(14),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
