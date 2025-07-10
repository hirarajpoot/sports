import 'package:flutter/material.dart';

class InfoCardFixed extends StatelessWidget {
  final String label;
  final String value;
  final double Function(double) baseFont;

  const InfoCardFixed(this.label, this.value, this.baseFont, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 79,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x4D2E8A57),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: baseFont(12),
              color: const Color(0xFF2E8A57),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: baseFont(14),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E8A57),
            ),
          ),
        ],
      ),
    );
  }
}
