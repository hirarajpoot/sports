import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/club_details_controller.dart';

class TabButtons extends StatelessWidget {
  final ClubDetailsController controller;
  final tabs = ['About', 'Sponsor', 'Feed'];
  TabButtons({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabs.length, (i) {
            final sel = controller.currentIndex.value == i;
            return GestureDetector(
              onTap: () => controller.selectTab(i),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: sel ? const Color(0xFF2E8A50) : const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tabs[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: sel ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            );
          }),
        ),
      );
}
