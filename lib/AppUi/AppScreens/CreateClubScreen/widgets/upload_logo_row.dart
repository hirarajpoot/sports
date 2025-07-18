import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/club_creation_controller.dart';

class ClubLogoUploadRow extends StatelessWidget {
  final controller = Get.find<ClubCreationController>();

  ClubLogoUploadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          return Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
              image: controller.imagePath.value.isNotEmpty
                  ? DecorationImage(
                      image: FileImage(File(controller.imagePath.value)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: controller.imagePath.value.isEmpty
                ? const Icon(Icons.download_rounded, size: 41, color: Colors.grey)
                : null,
          );
        }),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: controller.pickImage,
          child: Container(
            width: 197,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: const [
                Icon(Icons.upload_file, size: 29, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Upload Image',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFFA39F9F),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
