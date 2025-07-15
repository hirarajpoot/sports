import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/create_tournament_controller.dart';

class NumberOfTeamsField extends StatelessWidget {
  const NumberOfTeamsField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTournamentController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Number of Teams',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => controller.pickNumberOfTeams(context),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, // ✅ Field bg white
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.selectedTeams.value,
                      style: const TextStyle(fontFamily: 'Inter'),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ), // ✅ No extra bg
              ],
            ),
          ),
        ),
      ],
    );
  }
}
