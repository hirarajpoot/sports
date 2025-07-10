import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/match_preview_controller.dart';

class ReadyStatusCard extends StatelessWidget {
  final MatchPreviewController ctrl;
  final double Function(double) baseFont;

  const ReadyStatusCard({
    super.key,
    required this.ctrl,
    required this.baseFont,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: 79,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0x4D2E8A57),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 143,
              height: 24,
              child: Center(
                child: Text(
                  ctrl.isReady.value ? 'Start Match' : 'Ready To Start',
                  style: TextStyle(
                    fontSize: baseFont(16),
                    color: const Color(0xFF2E8A57),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 164,
              height: 15,
              child: Center(
                child: Text(
                  'All team is ready for Kick‑Off',
                  style: TextStyle(
                    fontSize: baseFont(12),
                    color: const Color(0xFF2E8A57),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
