import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/signup_controller.dart';

class MobileInputField extends StatelessWidget {
  MobileInputField({super.key});

  final SignupController controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/flag 1.png', width: 24, height: 16),
              const SizedBox(width: 6),
              const Text(
                "+91",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller.phoneController,
            maxLength: 10,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              counterText: "",
              hintText: "XXXXXX",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontFamily: 'Inter',
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
            ),
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.black,
            ),
            onChanged: controller.onPhoneChanged,
          ),
        ),
      ],
    );
  }
}
