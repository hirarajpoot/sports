import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const TextField(
            maxLines: null,
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(fontFamily: 'Inter'),
          ),
        ),
      ],
    );
  }
}
