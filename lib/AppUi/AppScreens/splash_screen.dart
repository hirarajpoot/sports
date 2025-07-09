import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/s.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/logo.png',
                width: 250,
                height: 250,
              ),
            ),
          ),
        );
      },
    );
  }
}
