import 'package:flutter/material.dart';

class VsCircle extends StatelessWidget {
  final double Function(double) baseFont;
  const VsCircle({super.key, required this.baseFont});

  @override
  Widget build(BuildContext c) => CircleAvatar(
    radius: 25, backgroundColor: Colors.grey.shade400,
    child: Text('VS', style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold, color: Colors.white)),
  );
}
