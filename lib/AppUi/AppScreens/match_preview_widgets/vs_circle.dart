import 'package:flutter/material.dart';

class VsCircle extends StatelessWidget {
  final bool isWide;

  const VsCircle({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWide ? 40 : 32,
      height: isWide ? 40 : 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
      ),
      alignment: Alignment.center,
      child: const Text(
        'VS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}
