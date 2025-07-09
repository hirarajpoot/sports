import 'package:flutter/material.dart';
class ProfileCard extends StatelessWidget {
  final bool isWide;
  const ProfileCard({super.key, required this.isWide});
  @override
  Widget build(BuildContext c) => Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: isWide ? 48 : 40,
        backgroundImage: AssetImage('assets/images/Ellipse 64.png'),
      ),
      Positioned(
        bottom: 0, right: 0,
        child: Container(
          width: isWide ? 26 : 22,
          height: isWide ? 26 : 22,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Icon(Icons.edit, color: Colors.white, size: isWide ? 14 : 12),
        ),
      ),
    ],
  );
}
