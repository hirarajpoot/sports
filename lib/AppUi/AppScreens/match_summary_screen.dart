import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/match_summary_controller.dart';
import 'MatchSummaryWidgets/match_result_container.dart';
import 'MatchSummaryWidgets/man_of_the_match_card.dart';
import 'MatchSummaryWidgets/goal_scorers_list.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class MatchSummaryScreen extends StatelessWidget {
  MatchSummaryScreen({super.key});

  final controller = Get.put(MatchSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () => Get.back(),
                        ),
                        const Spacer(),
                        const Text(
                          'Match Summary',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Inter',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Widgets
                    const MatchResultContainer(),
                    const SizedBox(height: 16),
                    const ManOfTheMatchCard(),
                    const SizedBox(height: 16),
                    const GoalScorersList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
