import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/home_controller.dart';
import 'HomeScreen-Widgets/Widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.05,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/ground.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 32 : 16,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            const AssetImage('assets/images/Ellipse 64.png'),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/bell.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/icons/menu.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      width: isWide ? 350 : double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/start.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
