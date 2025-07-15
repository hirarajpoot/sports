import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  final bool isWide;

  const ProfileHeader({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10), // ✅ Top spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 32,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
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
          const SizedBox(height: 5),
          const CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage('assets/images/User image.png'),
          ),
          const SizedBox(height: 5),
          Text(
            "Itunuoluwa Abidoye",
            style: TextStyle(
              fontSize: isWide ? 16 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}
