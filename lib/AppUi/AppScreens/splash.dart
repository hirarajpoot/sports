import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utlies/routes/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Get.offAllNamed(AppRoutes.meet);
            }
          })
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width * 0.8;
    double fieldHeight = 28; 
    double ballSize = 40;    

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
              left: (MediaQuery.of(context).size.width - fieldWidth) / 2,
              child: SizedBox(
                width: fieldWidth,
                child: Column(
                  children: [
                    const Text(
                      'B U I L D   F O R   B A L L E R S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: fieldHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (ctx, child) {
                          final pos =
                              _controller.value * (fieldWidth - ballSize);
                          return Stack(
                            children: [
                              Positioned(
                                left: pos,
                                top: -(ballSize - fieldHeight) / 2, 
                                child: child!,
                              ),
                            ],
                          );
                        },
                        child: Image.asset(
                          'assets/images/goldfootball.png',
                          width: ballSize,
                          height: ballSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
