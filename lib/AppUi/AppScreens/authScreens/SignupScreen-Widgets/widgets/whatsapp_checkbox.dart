import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/signup_controller.dart';

class WhatsappCheckbox extends StatelessWidget {
  final SignupController controller;

  WhatsappCheckbox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Checkbox(
              value: controller.isWhatsappChecked.value,
              onChanged: controller.toggleWhatsapp,
              activeColor: Colors.green,
            ),
            Expanded(
              child: Text(
                "I agree to receive updates over WhatsApp",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ));
  }
}
