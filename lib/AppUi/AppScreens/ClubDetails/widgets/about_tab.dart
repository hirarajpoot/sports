import 'package:flutter/material.dart';
import '../../../Models/club_model.dart';

class AboutTab extends StatelessWidget {
  final Club club;
  const AboutTab({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Container(
          width: 346,
          height: 328,
          padding: const EdgeInsets.all(16),
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
              Row(children: [
                ClipOval(
                  child: Image.asset(
                    club.imagePath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'About Local Tennis Club',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ]),
              const SizedBox(height: 12),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'friendly match friendly match friendly match friendly match friendly match friendly match friendly match...',
                    style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
