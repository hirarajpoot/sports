import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'comment_sheet.dart';

class PostCard extends StatelessWidget {
  final bool isWide;

  const PostCard({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final RxBool isCheered = false.obs;

    return Center(
      child: Container(
        width: isWide ? 500 : double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
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
                  children: const [
                    Text(
                      'Elite Club',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      '2 hours ago',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'What a thrilling match today between the Warriors and Titans! Unforgettable moments!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/match.jpg', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => isCheered.toggle(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.celebration,
                          size: 20,
                          color: isCheered.value ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Cheer up',
                          style: TextStyle(
                            fontSize: 13,
                            color: isCheered.value ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showCommentSheet(context),
                    child: Row(
                      children: const [
                        Icon(Icons.comment_bank_outlined, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Comment', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      const message = 'What a thrilling match!\nCheck it out:\nhttps://example.com/match';
                      Share.share(message);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Share', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
