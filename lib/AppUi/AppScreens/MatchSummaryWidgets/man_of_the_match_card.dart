import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/match_summary_controller.dart';

class ManOfTheMatchCard extends StatelessWidget {
  const ManOfTheMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MatchSummaryController>();

    return Container(
      width: 336,
      height: 449,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF97A2B7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 4),
            blurRadius: 50,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Man of the Match',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 98,
            height: 98,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x4DFFFFFF),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/trophy 1.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Obx(() => Text(
                ctrl.manOfTheMatch.value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              )),
          Obx(() => Text(
                ctrl.position.value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              )),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
            ],
          ),
        ],
      ),
    );
  }
}
