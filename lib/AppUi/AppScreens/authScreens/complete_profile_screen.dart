import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/complete_profile_controller.dart';
import 'CompleteProfileScreen-Widgets/Widgets/profile_header.dart';
import 'CompleteProfileScreen-Widgets/Widgets/editable_field.dart';
import 'CompleteProfileScreen-Widgets/Widgets/done_button.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteProfileController());
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 100 : 24,
              vertical: 40,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.05,
                      child: Image.asset(
                        'assets/images/ground.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileHeader(isWide: isWide),
                      EditableField(
                        label: "First Name",
                        controller: controller.firstNameController,
                      ),
                      const SizedBox(height: 15),
                      EditableField(
                        label: "Last Name",
                        controller: controller.lastNameController,
                      ),
                      const SizedBox(height: 15),
                      EditableField(
                        label: "Email ID",
                        controller: controller.emailController,
                      ),
                      const SizedBox(height: 15),
                      EditableField(
                        label: "Phone",
                        controller: controller.phoneController,
                      ),
                      const SizedBox(height: 30),
                      DoneButton(controller: controller),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
