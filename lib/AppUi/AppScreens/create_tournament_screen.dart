import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/create_tournament_controller.dart';
import '../AppScreens/CreateTournamentScreen/widgets/upload_logo_box.dart';
import '../AppScreens/CreateTournamentScreen/widgets/number_of_teams_field.dart';
import '../AppScreens/CreateTournamentScreen/widgets/description_field.dart';
import '../AppScreens/CreateTournamentScreen/widgets/date_fields_row.dart';
import '../AppScreens/CreateTournamentScreen/widgets/start_button.dart';
import '../AppScreens/CreateTournamentScreen/widgets/tournament_name_field.dart';
import '../AppScreens/CreateTournamentScreen/widgets/select_teams_container.dart';

class CreateTournamentScreen extends StatelessWidget {
  CreateTournamentScreen({super.key});
  final controller = Get.put(CreateTournamentController());

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Create Tournament',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? screenWidth * 0.2 : 16,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UploadLogoBox(),
              const SizedBox(height: 20),
              const TournamentNameField(),
              const SizedBox(height: 20),
              const DescriptionField(),
              const SizedBox(height: 20),
              const TournamentNameField(),
              const SizedBox(height: 20),
              const NumberOfTeamsField(),
              const SizedBox(height: 20),
              const SelectTeamsContainer(),
              const SizedBox(height: 20),
              const DateFieldsRow(),
              const SizedBox(height: 30),
              const StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
