import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/club_controller.dart';
import '../AppScreens/ClubScreen/Widgets/club_card.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());
    // final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Clubs',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.selectTab(0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 0
                                    ? const Color(0xFF2E8A50)
                                    : const Color(0xFFDEDEDE),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Your clubs',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: controller.selectedTab.value == 0
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.goToCreateClub(),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 1
                                    ? const Color(0xFF2E8A50)
                                    : const Color(0xFFDEDEDE),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '+ Create Club',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: controller.selectedTab.value == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.clubs.length,
                        itemBuilder: (context, index) {
                          final club = controller.clubs[index];
                          return ClubCard(
                            club: club,
                             onTap: () => Get.toNamed('/club-details'),
                            showImage: index == 0,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
