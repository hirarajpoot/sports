import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/team_selection_controller.dart';

class SelectClubSwitch extends StatelessWidget {
  final double Function(double) baseFont;
  final TeamSelectionController controller;

  const SelectClubSwitch({
    super.key,
    required this.baseFont,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.credit_card, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Text(
            'Select Club',
            style: TextStyle(
              fontSize: baseFont(14),
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Obx(
            () => Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Transform.scale(
                scaleX: 0.8,
                scaleY: 0.7,
                child: Switch(
                  value: controller.isClubSelected.value,
                  onChanged: (v) => controller.isClubSelected.value = v,
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
