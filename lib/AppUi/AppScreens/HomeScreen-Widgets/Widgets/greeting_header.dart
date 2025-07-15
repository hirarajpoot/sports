import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../widgets/Common-Widgets/custom_drawer.dart';
import '../../HomeScreen-Widgets/Widgets/notifications_screen.dart';

class GreetingHeader extends StatelessWidget {
  final RxBool showDrawer;

  const GreetingHeader({super.key, required this.showDrawer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/Ellipse 64.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 200,
                  height: 20,
                  child: Text(
                    "Hi, Akshay!",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 12, color: Color(0xFF8BC83F)),
                    SizedBox(width: 4),
                    Text(
                      "Street, City, State, Zip Code, Country",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => Get.to(() => const NotificationsScreen()),
              child: Image.asset(
                'assets/icons/bell.png',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => showDrawer.value = true,
              child: Image.asset(
                'assets/icons/menu.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
