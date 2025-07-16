import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';

class InfoRows extends StatelessWidget {
  final bool isWide;
  const InfoRows({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatsController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Obx(() => Text(
                    controller.playerStats.value.name,
                    style: TextStyle(fontSize: isWide ? 16 : 14),
                  )),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Position", style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Obx(
                () => DropdownButton<String>(
                  value: controller.selectedPosition.value,
                  items: ['Midfielder', 'Striker', 'Defender']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.changePosition(val);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
