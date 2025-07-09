import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';
class TabsRow extends StatelessWidget {
  final bool isWide;
  final StatsController controller;
  const TabsRow({required this.isWide, required this.controller});
  @override
  Widget build(BuildContext c) => Obx(() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: ["Stats", "Matches", "Tournament"].asMap().entries.map((e){
      final idx = e.key;
      return GestureDetector(
        onTap: () => controller.currentTab(idx),
        child: Column(children: [
          Text(e.value, style: TextStyle(fontSize: isWide ? 16 : 14, fontWeight: FontWeight.bold, color: const Color(0xFF1A9A5D))),
          const SizedBox(height: 4),
          if (controller.currentTab.value == idx)
            Container(width: 60, height: 3, color: const Color(0xFF1A9A5D)),
        ]),
      );
    }).toList(),
  ));
}
