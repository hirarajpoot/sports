import 'package:flutter/material.dart';

class UploadLogoBox extends StatelessWidget {
  const UploadLogoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 57,
          width: 203,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Image.asset(
                'assets/images/camera.png',
                width: 34,
                height: 34,
              ),
              const SizedBox(width: 12),
              const Text(
                'Upload Logo',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '(optional)',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
