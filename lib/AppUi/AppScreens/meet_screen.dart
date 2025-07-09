import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/meet_controller.dart';

class MeetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetController>(
      init: MeetController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/bg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: isMobile ? 40 : 80,
                        left: 20,
                        right: 20,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Meet",
                              style: TextStyle(
                                fontSize: isMobile ? 28 : 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Level up your game.Connect with\n athletes from every sport.",
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 18,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: isMobile ? 30 : 50),
                            SizedBox(
                              width: double.infinity,
                              height: isMobile ? 50 : 60,
                              child: ElevatedButton(
                                onPressed: () => controller.goToNextScreen(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2E8A57),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "KICK OFF",
                                      style: TextStyle(
                                        fontSize: isMobile ? 16 : 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Image.asset(
                                      'assets/images/football.png',
                                      width: isMobile ? 20 : 26,
                                      height: isMobile ? 20 : 26,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
