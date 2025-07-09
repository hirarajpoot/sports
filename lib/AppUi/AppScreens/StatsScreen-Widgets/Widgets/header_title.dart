import 'package:flutter/material.dart';
class HeaderTitle extends StatelessWidget {
  final bool isWide;
  final String title;
  const HeaderTitle({required this.isWide, required this.title});
  @override
  Widget build(BuildContext c) => Center(
    child: Text(title, style: TextStyle(
      fontSize: isWide ? 35 : 30,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    )),
  );
}
