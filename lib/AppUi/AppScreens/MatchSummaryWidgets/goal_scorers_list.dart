import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/match_summary_controller.dart';
import 'goal_scorer_card.dart';

class GoalScorersList extends StatelessWidget {
  const GoalScorersList({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MatchSummaryController>();

    return Container(
      width: 336,
      height: 286,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x262E8A57), Color(0x26FFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Goal Scorers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: ctrl.goalScorers.length,
                  itemBuilder: (context, index) {
                    final player = ctrl.goalScorers[index];
                    return GoalScorerCard(
                      minute: player['minute'] ?? '',
                      position: player['position'] ?? '',
                      team: player['team'] ?? '',
                      playerName: player['name'] ?? '',
                      isTopBox: index == 0,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
