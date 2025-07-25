import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Models/club_model.dart';

class ClubCard extends StatelessWidget {
  final Club club;
  final VoidCallback onTap;

  const ClubCard({super.key, required this.club, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    try {
      if (club.imagePath.startsWith('assets/')) {
        imageProvider = AssetImage(club.imagePath);
      } else {
        imageProvider = FileImage(File(club.imagePath));
      }
    } catch (_) {
      imageProvider = const AssetImage('assets/images/default.png');
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧾 Club Name + Match Type
          Text(
            club.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            club.matchType,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 12),

          // 🏷️ Category + Members + Image
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ⬇️ Image aligned slightly lower
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: ClipOval(
                  child: Image(
                    image: imageProvider,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 🏷️ Category and Members
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        club.category,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${club.members} Members',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔘 View Details Button
          Center(
            child: SizedBox(
              width: 270,
              height: 43,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E8A50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                onPressed: onTap,
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
