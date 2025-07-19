import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/create_tournament_controller.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTournamentController>();

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // ✅ Send selected teams to TournamentPreviewScreen
          if (controller.selectedTeams.isNotEmpty) {
            // Get.toNamed(
            //   '/tournament-preview',
            //   arguments: controller.selectedTeams,
            // );
          } else {
            Get.snackbar(
              "No Teams Selected",
              "Please select at least 2 teams to start the tournament.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E8A57),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text(
          'Start Tournament',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
