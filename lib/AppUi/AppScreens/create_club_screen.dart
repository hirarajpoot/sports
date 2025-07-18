import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/club_creation_controller.dart';
import '../AppScreens/CreateClubScreen/widgets/club_text_field.dart';
import '../AppScreens/CreateClubScreen/widgets/create_club_buttons.dart';
import '../AppScreens/CreateClubScreen/widgets/create_club_header.dart';
import '../AppScreens/CreateClubScreen/widgets/upload_logo_row.dart';

class CreateClubScreen extends StatelessWidget {
  CreateClubScreen({super.key});

  final controller = Get.put(ClubCreationController());
  final nameController = TextEditingController();
  final aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateClubHeader(),
                    const SizedBox(height: 30),
                    const Text(
                      'Club Logo',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 14),
                     ClubLogoUploadRow(),
                    const SizedBox(height: 30),
                    ClubTextField(
                      label: 'Club Name',
                      hint: 'Enter Club Name',
                      controller: nameController,
                      onChanged: controller.setClubName,
                    ),
                    const SizedBox(height: 20),
                    ClubTextField(
                      label: 'About the Club',
                      hint: 'Tell Us About your Club',
                      controller: aboutController,
                      onChanged: controller.setAbout,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 40),
                    CreateClubButton(controller: controller),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
