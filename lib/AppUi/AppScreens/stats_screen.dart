import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/stats_controller.dart';
import 'StatsScreen-Widgets/Widgets/top_bar.dart';
import 'StatsScreen-Widgets/Widgets/header_title.dart';
import 'StatsScreen-Widgets/Widgets/profile_card.dart';
import 'StatsScreen-Widgets/Widgets/action_buttons.dart';
import 'StatsScreen-Widgets/Widgets/info_rows.dart';
import 'StatsScreen-Widgets/Widgets/tabs_row.dart';
import 'StatsScreen-Widgets/Widgets/stats_boxes_row.dart';
import 'StatsScreen-Widgets/Widgets/start_match_button.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(StatsController());
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.05,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/ground.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 32 : 16,
                vertical: isWide ? 24 : 16,
              ),
              child: Column(
                children: [
                  TopBar(isWide: isWide),
                  const SizedBox(height: 24),
                  HeaderTitle(isWide: isWide, title: 'Stats'),
                  const SizedBox(height: 12),
                  ProfileCard(isWide: isWide),
                  const SizedBox(height: 36),
                  ActionButtons(isWide: isWide),
                  const SizedBox(height: 16),
                  InfoRows(isWide: isWide),
                  const SizedBox(height: 24),
                  TabsRow(isWide: isWide, controller: cont),
                  const SizedBox(height: 16),
                  StatsBoxesRow(isWide: isWide),
                  const Spacer(),
                  const StartMatchButton(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
