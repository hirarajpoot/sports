import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/tournament_model.dart';
class CreateTournamentController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  var selectedTeams = <String>[
    "Team A",
    "Team B",
    "Team C",
    "Team D",
  ].obs;

  var tournament = Tournament(
    name: '',
    description: '',
    logoPath: '',
    numberOfTeams: 4,
    selectedTeams: [],
  ).obs;

  void startTournament() {
    // Pass selected teams dynamically
    Get.toNamed(
      '/tournament-preview',
      arguments: selectedTeams,
    );
  }

  void selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
