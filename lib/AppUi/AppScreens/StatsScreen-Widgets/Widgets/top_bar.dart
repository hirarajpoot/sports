import 'package:flutter/material.dart';
class TopBar extends StatelessWidget {
  final bool isWide;
  const TopBar({required this.isWide});
  @override
  Widget build(BuildContext c) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset('assets/icons/blacklogo.png', height: isWide ? 100 : 100),
      Row(children: [
        Image.asset('assets/icons/bell.png', width: isWide ? 28 : 24, height: isWide ? 28 : 24),
        const SizedBox(width: 16),
        Image.asset('assets/icons/menu.png', width: isWide ? 28 : 24, height: isWide ? 28 : 24),
      ]),
    ],
  );
}
