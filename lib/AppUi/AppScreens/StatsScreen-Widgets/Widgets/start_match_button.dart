import 'package:flutter/material.dart';

class StartMatchButton extends StatelessWidget {
  const StartMatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 56,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E8A57), // ✅ #2E8A57
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // ✅ Radius 12
            ),
          ),
          onPressed: () {
            // TODO: Add navigation or action here
          },
          icon: Image.asset(
            'assets/images/football.png',
            width: 22,
            height: 22,
          ),
          label: const Text(
            "Start Match",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter', // ✅ Font Inter
              fontWeight: FontWeight.w600, // ✅ Semi-bold
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
