import 'package:flutter/material.dart';

class BottomInfoBox extends StatelessWidget {
  const BottomInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 79,
      decoration: BoxDecoration(
        color: const Color(0x4D2E8A57), // #2E8A57 with 30% opacity
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Ready To Start',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'All team is ready for Kick-Off',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
