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
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showNumberOfTeamsDialog(context, controller),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      "${controller.selectedTeams.length} Teams Selected",
                      style: const TextStyle(fontFamily: 'Inter'),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showNumberOfTeamsDialog(
    BuildContext context,
    CreateTournamentController controller,
  ) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [2, 4, 6, 8].map((numTeams) {
            return ListTile(
              title: Text("$numTeams Teams"),
              onTap: () {
                controller.updateSelectedTeams(numTeams);
                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
