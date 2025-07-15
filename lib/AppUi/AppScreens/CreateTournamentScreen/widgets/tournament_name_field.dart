import 'package:flutter/material.dart';

class TournamentNameField extends StatelessWidget {
  const TournamentNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tournament Name',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const TextField(
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(fontFamily: 'Inter'),
          ),
        ),
      ],
    );
  }
}
