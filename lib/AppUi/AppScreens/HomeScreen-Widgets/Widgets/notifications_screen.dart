import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AddPlayersScreen-Widgets/widgets/background_layer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'name': 'Abidoye',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': '1m ago',
        'image': 'assets/images/User image.png',
      },
      {
        'name': 'Lana Steiner',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': '5m ago',
        'image': 'assets/images/User image.png',
      },
      {
        'name': 'Phoenix Baker',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': '15 Hrs ago',
        'image': 'assets/images/User image.png',
      },
      {
        'name': 'Lana Steiner',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': '20 Hrs ago',
        'image': 'assets/images/User image.png',
      },
      {
        'name': 'Lana Steiner',
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'time': '1 day ago',
        'image': 'assets/images/User image.png',
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(), // ✅ Background image layer
          SafeArea(
            child: Column(
              children: [
                // ✅ Top App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(flex: 2), // To balance back arrow
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // ✅ Notification List
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: notifications.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.black12, thickness: 1),
                    itemBuilder: (context, index) {
                      final item = notifications[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                item['image']!,
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Name & Message
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['message']!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),

                            // Time Ago
                            Text(
                              item['time']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
