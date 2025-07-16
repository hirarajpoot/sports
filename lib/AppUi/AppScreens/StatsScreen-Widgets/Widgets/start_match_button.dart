import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/stats_controller.dart';

class StartMatchButton extends StatelessWidget {
  const StartMatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatsController>();

    return Center(
      child: SizedBox(
        width: 350,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E8A57),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: controller.findSponsors,
          child: const Text(
            "Find Sponsors",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
