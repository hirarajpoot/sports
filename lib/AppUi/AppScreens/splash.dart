import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../Controllers/auth-controllers/splash_controller.dart';
import '../Utlies/routes/app_routes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 50),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 50), () {
          Get.offAllNamed(AppRoutes.meet);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fieldWidth = 300;
    double ballSize = 20;

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A9A5D), Color(0xFF76D7C4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'B U I L D   F O R   B A L L E R S',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: fieldWidth,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                double maxPosition = fieldWidth - ballSize;
                                double position =
                                    _animation.value * maxPosition;
                                double opacity = (_animation.value > 0.95)
                                    ? 1.0 - ((_animation.value - 0.95) * 20)
                                    : 1.0;

                                return Positioned(
                                  left: position,
                                  top: (25 - ballSize) / 2,
                                  child: Opacity(
                                    opacity: opacity.clamp(0.0, 1.0),
                                    child: child!,
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/goldfootball.png',
                                width: ballSize,
                                height: ballSize,
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, right: 5),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
