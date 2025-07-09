import 'package:flutter/material.dart';
class InfoBox extends StatelessWidget {
  final double Function(double) baseFont;
  const InfoBox({super.key, required this.baseFont});
  @override
  Widget build(BuildContext c) => Container(
    height: 79, decoration: BoxDecoration(color: const Color(0xFF2E8A57), borderRadius: BorderRadius.circular(6)),
    child: Row(children: [
      _col('Players','5v5'),
      _divider(),
      _col('Ground','Turf'),
      _divider(),
      _col('Duration','10 min'),
    ]),
  );

  Widget _col(String t, String v) => Expanded(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(t, style: TextStyle(fontSize: baseFont(12), color: Colors.white.withOpacity(0.8))),
      Text(v, style: TextStyle(fontSize: baseFont(14), fontWeight: FontWeight.bold, color: Colors.white)),
    ]),
  );

  Widget _divider() => SizedBox(
    height: 79, width: 1,
    child: Center(child: Container(height: 35, width: 1, color: Colors.white.withOpacity(0.3))),
  );
}
