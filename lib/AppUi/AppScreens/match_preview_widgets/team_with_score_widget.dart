import 'package:flutter/material.dart';

class TeamWithScoreWidget extends StatelessWidget {
  final String name;
  final int score;
  final Color borderColor;
  final Function(int) onChanged;

  const TeamWithScoreWidget({
    super.key,
    required this.name,
    required this.score,
    required this.borderColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 8),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/football.png',
              width: 45,
              height: 45,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Goal',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 42,
          height: 42,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: score.toString()),
            onChanged: (v) => onChanged(int.tryParse(v) ?? 0),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
