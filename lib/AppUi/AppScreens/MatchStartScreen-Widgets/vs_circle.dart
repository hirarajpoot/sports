import 'package:flutter/material.dart';

class VsCircle extends StatelessWidget {
  const VsCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 29,
      decoration: const BoxDecoration(
        color: Color(0xFF80868E),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: const Text(
        'VS',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
