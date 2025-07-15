import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';

class InfoRows extends StatelessWidget {
  final bool isWide;
  final StatsController controller;

  const InfoRows({super.key, required this.isWide, required this.controller});

  @override
  Widget build(BuildContext c) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 35,
    ), // ✅ Added 30px padding both sides
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "Name",
              style: TextStyle(
                fontSize: isWide ? 16 : 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text("Akshay", style: TextStyle(fontSize: isWide ? 16 : 14)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "Position",
              style: TextStyle(
                fontSize: isWide ? 16 : 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Obx(
              () => DropdownButton<String>(
                value: controller.selectedPosition.value,
                items: ['Midfielder', 'Striker', 'Defender']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) controller.selectedPosition(val);
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
