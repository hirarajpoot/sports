import 'package:flutter/material.dart';

class EditableField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const EditableField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3), 
        Container(
          height: 38, 
          decoration: BoxDecoration(
            color: Colors.white, 
            border: const Border(
              bottom: BorderSide(
                color: Color(0xFFDDDDDD), 
                width: 1.0, 
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 13, color: Colors.black),
            decoration: const InputDecoration(
              border: InputBorder.none, 
              isDense: true,
              contentPadding: EdgeInsets.only(
                top: 8,
              ), 
              suffix: Icon(Icons.edit, size: 16, color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
