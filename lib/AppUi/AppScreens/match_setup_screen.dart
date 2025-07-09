import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/match_setup_controller.dart';
import '../AppScreens/MatchSetupScreen-Widgets/top_bar.dart';
import '../AppScreens/MatchSetupScreen-Widgets/configure_card.dart';
import '../AppScreens/MatchSetupScreen-Widgets/continue_button.dart';

class MatchSetupScreen extends StatelessWidget {
  const MatchSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(MatchSetupController());
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopBar(isWide: isWide),
      body: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              'assets/images/ground.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? mq.size.width * 0.2 : 24,
            vertical: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 16),
              ConfigureCard(isWide: isWide),
              const SizedBox(height: 118),
              ContinueButton(isWide: isWide, onTap: cont.toTeamSelection),
              const SizedBox(height: 24),
            ],
          ),
        )
      ]),
    );
  }
}
