import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Controllers/auth-controllers/match_summary_controller.dart';

class GoalScorerCard extends StatelessWidget {
  final String minute;
  final String position;
  final String team;
  final String playerName;
  final bool isTopBox;

  const GoalScorerCard({
    super.key,
    required this.minute,
    required this.position,
    required this.team,
    required this.playerName,
    this.isTopBox = false,
  });

  @override
  Widget build(BuildContext context) {
    // final ctrl = Get.find<MatchSummaryController>();

    return GestureDetector(
      // onTap: ctrl.navigateToNextScreen,
      child: Container(
        width: 330,
        height: 79,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFF2E8A57), width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/football.png', width: 32, height: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    '$minute - $position',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    team,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  size: 18,
                  color: isTopBox ? Colors.amber : Colors.transparent,
                  shadows: isTopBox
                      ? []
                      : [Shadow(color: Colors.grey.shade400, blurRadius: 1)],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
