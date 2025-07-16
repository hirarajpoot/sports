import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/signup_controller.dart';
import '../../Widgets/Common-Widgets/top_section.dart';
import 'SignupScreen-Widgets/widgets/mobile_input_field.dart';
import 'SignupScreen-Widgets/widgets/send_otp_button.dart';
import 'SignupScreen-Widgets/widgets/whatsapp_checkbox.dart';
import 'SignupScreen-Widgets/widgets/terms_and_privacy.dart';

class SignupScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TopSection(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You're Almost There!",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Enter Mobile Number",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    MobileInputField(),
                    const SizedBox(height: 20),
                    SendOtpButton(),
                    const SizedBox(height: 10),
                    WhatsappCheckbox(),
                    const SizedBox(height: 10),
                    const TermsAndPrivacyText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
