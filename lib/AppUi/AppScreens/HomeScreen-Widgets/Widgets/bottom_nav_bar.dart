import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.currentIndex.value = index;

          switch (index) {
            case 1:
              Get.toNamed('/stats');
              break;
            case 2:
              Get.toNamed('/clubs-screen');
              break;
            case 3:
              Get.toNamed('/challenge-screen');
              break;
            // No navigation on index 0 (Home)
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8BC83F),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/home.png', 0, controller),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/per.png', 1, controller),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/dor.png', 2, controller),
            label: 'Clubs',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/se.png', 3, controller),
            label: 'Challenge',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String path, int index, HomeController controller) {
    final isActive = controller.currentIndex.value == index;
    return Image.asset(
      path,
      height: 24,
      color: isActive ? const Color(0xFF8BC83F) : Colors.grey,
    );
  }
}
