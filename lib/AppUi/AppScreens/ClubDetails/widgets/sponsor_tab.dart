import 'package:flutter/material.dart';
import '../../../Models/club_model.dart';

class SponsorTab extends StatelessWidget {
  final Club club;
  const SponsorTab({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            Row(children: const [
              Icon(Icons.emoji_events, color: Color(0xFF2E8A50), size: 32),
              SizedBox(width: 12),
              Text(
                'Sponsors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
              ),
            ]),
            const SizedBox(height: 12),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'This club is proudly sponsored by SportsX, FitPro Gear, and National Bank...',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
