import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  final bool isWide;

  const ProfileHeader({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1), // ✅ Tight top spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔥 Back button (now using IconButton for bigger tap area)
              IconButton(
                padding: EdgeInsets.zero, // Remove default padding
                constraints: const BoxConstraints(), // Remove size constraints
                onPressed: () {
                  Get.back(); // ✅ Navigate back
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 32,
                  color: Colors.black87,
                ),
              ),
              const Spacer(), // Push heading to center
              Text(
                "Complete Profile",
                style: TextStyle(
                  fontSize: isWide ? 24 : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),

          const SizedBox(height: 50),

          const CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage('assets/images/User image.png'),
          ),

          const SizedBox(height: 30),

          Text(
            "Itunuoluwa Abidoye",
            style: TextStyle(
              fontSize: isWide ? 16 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 30),

          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
