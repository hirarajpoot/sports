import 'package:flutter/material.dart';

class StatsBoxesRow extends StatelessWidget {
  final bool isWide;
  const StatsBoxesRow({required this.isWide});
  @override
  Widget build(BuildContext c) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _box("Matches", "600"),
      _box("Goals", "400"),
      _box("Defenders", "42 pts"),
    ],
  );
  Widget _box(String title, String value) => Container(
    width: isWide ? 100 : 90, padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFF1A9A5D)), borderRadius: BorderRadius.circular(8)),
    child: Column(children: [
      Text(title, style: TextStyle(fontSize: isWide ? 14 : 12, color: const Color(0xFF1A9A5D))),
      const SizedBox(height: 4),
      Text(value, style: TextStyle(fontSize: isWide ? 18 : 16, fontWeight: FontWeight.bold, color: const Color(0xFF1A9A5D))),
    ]),
  );
}
