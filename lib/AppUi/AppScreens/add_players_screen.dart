import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/add_players_controller.dart';
import '../AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import './AddPlayersScreen-Widgets/widgets/top_back_button.dart';
import './AddPlayersScreen-Widgets/widgets/header_text.dart';
import './AddPlayersScreen-Widgets/widgets/player_option_card.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPlayersController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Stack(
              children: [
                TopBackButton(onTap: controller.goBack),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      const HeaderText(),
                      const SizedBox(height: 32),
                      const Text(
                        'Choose how to add players',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PlayerOptionCard(
                        onTap: controller.navigateToPhoneInput,
                        imagePath: 'assets/images/tele.png',
                        title: 'Add via Phone Number',
                        subtitle:
                            'Enter player name and contact number manually',
                        bgColor: const Color(0x9E02F66F),
                      ),
                      const SizedBox(height: 16),
                      PlayerOptionCard(
                        onTap: controller.navigateToContacts,
                        imagePath: 'assets/images/person.png',
                        title: 'Add From Contacts',
                        subtitle:
                            'Select players from your phone’s contact book',
                        bgColor: const Color(0x4D3670ED),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
