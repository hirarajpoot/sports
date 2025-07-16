import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';

class StatsBoxesRow extends StatelessWidget {
  final bool isWide;
  const StatsBoxesRow({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatsController>();

    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _box("Matches", "${controller.playerStats.value.matchesPlayed}"),
            _box("Goals", "${controller.playerStats.value.goalsScored}"),
            _box("Defenders", controller.playerStats.value.defendersScore),
          ],
        ));
  }

  Widget _box(String title, String value) => Container(
        width: isWide ? 100 : 90,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF1A9A5D)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: [
          Text(title, style: TextStyle(fontSize: isWide ? 14 : 12, color: const Color(0xFF1A9A5D))),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: isWide ? 18 : 16, fontWeight: FontWeight.bold, color: const Color(0xFF1A9A5D))),
        ]),
      );
}
