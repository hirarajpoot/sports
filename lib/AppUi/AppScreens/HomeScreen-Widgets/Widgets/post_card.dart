import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/post_model.dart';
import 'comment_sheet.dart';
import 'package:share_plus/share_plus.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  PostCard({super.key, required this.post});

  final RxBool isCheered = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                children: [
                  Text(post.author,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(post.timeAgo,
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post.content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(post.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 180),
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
                      Icon(Icons.celebration,
                          size: 20, color: isCheered.value ? Colors.green : Colors.grey),
                      const SizedBox(width: 8),
                      Text('Cheer up',
                          style: TextStyle(
                              fontSize: 13,
                              color: isCheered.value ? Colors.green : Colors.grey)),
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
                    Share.share('${post.content}\nCheck it out: https://example.com/match');
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
    );
  }
}
