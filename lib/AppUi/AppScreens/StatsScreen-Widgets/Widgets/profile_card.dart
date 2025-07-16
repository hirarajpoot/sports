import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';

class ProfileCard extends StatelessWidget {
  final bool isWide;
  const ProfileCard({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatsController>();

    return Obx(() => Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: isWide ? 48 : 40,
              backgroundImage: AssetImage(controller.playerStats.value.profileImage),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: isWide ? 26 : 22,
                height: isWide ? 26 : 22,
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: const Icon(Icons.edit, color: Colors.white, size: 14),
              ),
            ),
          ],
        ));
  }
}
