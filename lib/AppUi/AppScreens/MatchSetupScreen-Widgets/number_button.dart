import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String label;
  final bool isWide;
  final VoidCallback? onTap;

  const NumberButton({super.key, required this.label, required this.isWide, this.onTap});

  @override
  Widget build(BuildContext c) {
    final mq = MediaQuery.of(c);
    baseFont(size) => size * mq.textScaleFactor;
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(label, style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold, color: Colors.black87)),
        ),
      ),
    );
  }
}
