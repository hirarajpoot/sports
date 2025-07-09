import 'package:flutter/material.dart';

class TopBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const TopBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 20,
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
