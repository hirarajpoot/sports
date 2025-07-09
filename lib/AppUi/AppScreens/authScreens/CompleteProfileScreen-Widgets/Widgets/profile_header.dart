import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final bool isWide;

  const ProfileHeader({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(-8, 0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.chevron_right,
                    size: 32,
                    color: Colors.black87,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Complete Profile",
                  style: TextStyle(
                    fontSize: isWide ? 24 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        const CircleAvatar(
          radius: 36,
          backgroundImage: AssetImage('assets/images/User image.png'),
        ),

        const SizedBox(height: 6),

        Text(
          "Itunuoluwa Abidoye",
          style: TextStyle(
            fontSize: isWide ? 16 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 2),

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
    );
  }
}
