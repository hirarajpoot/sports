import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/club_creation_controller.dart';

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
                    // Top bar with back button and centered title
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () => Get.back(),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Create New Club',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
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

                    // Upload logo row
                    Row(
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Center(
                            child: Icon(Icons.download_rounded, size: 41, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 197,
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: const [
                              Icon(Icons.upload_file, size: 29, color: Colors.grey),
                              SizedBox(width: 10),
                              Text(
                                'Upload Image',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFFA39F9F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Club Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      onChanged: controller.setClubName,
                      decoration: InputDecoration(
                        hintText: 'Enter Club Name',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFFA39F9F),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: false,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'About the Club',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: aboutController,
                      onChanged: controller.setAbout,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Tell Us About your Club',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFFA39F9F),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: false,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ✅ Create Club Button
                    Center(
                      child: SizedBox(
                        width: 270,
                        height: 43,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E8A57),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            controller.createClub(); // method added in controller
                            Get.toNamed('/clubs-screen');
                          },
                          child: const Text(
                            'Create Club',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
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
