import 'package:flutter/material.dart';

class TeamCircle extends StatelessWidget {
  final String name;
  const TeamCircle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99,
      height: 99,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFA69D9D)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/football.png', width: 40, height: 39),
          const SizedBox(height: 6),
          SizedBox(
            width: 80,
            height: 14,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
