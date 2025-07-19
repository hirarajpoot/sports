import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/create_tournament_controller.dart';

class SelectTeamsContainer extends StatelessWidget {
  const SelectTeamsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTournamentController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Teams here',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: controller.selectedTeams.map((teamName) {
                  return GestureDetector(
                    onTap: () => Get.toNamed('/add-players'),
                    child: _teamBox(teamName),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }

  Widget _teamBox(String teamName) {
    return Container(
      width: 145,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xCCA4F2C7),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        teamName,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
