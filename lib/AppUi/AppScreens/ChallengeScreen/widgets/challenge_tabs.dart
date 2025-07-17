import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/challenge_controller.dart';

class ChallengeTabs extends StatelessWidget {
  final ChallengeController controller;

  const ChallengeTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(controller.tabs.length, (index) {
            bool isSelected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.selectedTab.value = index,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2E8A57)
                      : const Color(0xFFF3F0F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  controller.tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
