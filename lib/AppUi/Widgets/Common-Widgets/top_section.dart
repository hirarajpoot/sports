import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: Column(
            children: [
              Image.asset(
                'assets/icons/blacklogo.png',
                width: 120,
              ),
              SizedBox(height: 8),
              Text(
                "T  R  A  C  K   P  L  A  Y   D  O  M  I  N  A  T  E",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Image.asset(
          'assets/images/ground.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 220,
        ),
      ],
    );
  }
}
