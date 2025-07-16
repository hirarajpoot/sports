import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/tournaments_controller.dart';

class Tabs extends StatelessWidget {
  final double Function(double) scale;
  final TournamentsController controller;

  const Tabs({Key? key, required this.scale, required this.controller})
      : super(key: key);

  Widget buildTab(String label, int index, double width) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == index;
      return GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          width: scale(width),
          height: scale(57),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2E8A57) : const Color(0xFFF3F0F0),
            borderRadius: BorderRadius.circular(scale(8)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: scale(16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTab('Matches', 0, 90),
        buildTab('Leaderboard', 1, 120),
        buildTab('Points Table', 2, 120),
      ],
    );
  }
}
