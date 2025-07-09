import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final double Function(double) baseFont;
  final String label;
  final VoidCallback onTap;

  const TeamCard({super.key, required this.baseFont, required this.label, required this.onTap});

  @override
  Widget build(BuildContext c) => Column(children: [
    Container(
      width: 105, height: 105,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.add, size: 28, color: Colors.black),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: baseFont(14), fontWeight: FontWeight.w600, color: Colors.black87)),
      ]),
    ),
    const SizedBox(height: 16),
    SizedBox(
      width: 182, height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E8A57),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text('Select Team', style: TextStyle(fontSize: baseFont(14), fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    ),
  ]);
}
