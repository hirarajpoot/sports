import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/tournament_model.dart';

class CreateTournamentController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  /// ✅ Start with no teams selected
  var selectedTeams = <String>[].obs;

  var tournament = Tournament(
    name: '',
    description: '',
    logoPath: '',
    numberOfTeams: 0,
    selectedTeams: [],
  ).obs;

  /// ✅ Updates selected teams count and list
  void updateSelectedTeams(int count) {
    selectedTeams.value =
        List.generate(count, (index) => "Team ${String.fromCharCode(65 + index)}");
    tournament.value.numberOfTeams = count; // optional: sync with tournament
  }

  void selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
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
