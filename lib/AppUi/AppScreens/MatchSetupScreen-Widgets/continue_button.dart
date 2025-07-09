import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final bool isWide;
  final VoidCallback onTap;

  const ContinueButton({super.key, required this.isWide, required this.onTap});

  @override
  Widget build(BuildContext c) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E8A57),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text('Continue to Team selection', style: TextStyle(fontSize: isWide ? 16 : 16, fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }
}
