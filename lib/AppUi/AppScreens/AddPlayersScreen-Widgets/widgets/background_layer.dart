import 'package:flutter/material.dart';

class BackgroundLayer extends StatelessWidget {
  final Widget? child;

  const BackgroundLayer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    Widget background = Transform.translate(
      offset: const Offset(0, 90),
      child: Opacity(
        opacity: 0.05,
        child: Image.asset(
          'assets/images/ground.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );

    if (child != null) {
      return Stack(
        children: [
          background,
          child!,
        ],
      );
    } else {
      return background;
    }
  }
}
