import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTournamentController extends GetxController {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController numberOfTeamsController = TextEditingController();

  final List<String> teamNumbers = List.generate(20, (index) => '${index + 1}');
  RxString selectedTeams = '4'.obs;

  Future<void> selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  void pickNumberOfTeams(BuildContext context) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Select Number of Teams',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Colors.grey),
              Expanded(
                child: ListView.builder(
                  itemCount: teamNumbers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${teamNumbers[index]} Teams',
                        style: const TextStyle(fontFamily: 'Inter'),
                      ),
                      onTap: () {
                        selectedTeams.value = teamNumbers[index];
                        numberOfTeamsController.text = selectedTeams.value;
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  void startTournament() {
    Get.toNamed('tournament-preview');
  }
}
