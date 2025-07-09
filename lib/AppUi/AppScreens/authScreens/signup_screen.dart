import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/signup_controller.dart';
import '../../Widgets/Common-Widgets/top_section.dart';
import 'SignupScreen-Widgets/widgets/mobile_input_field.dart';
import 'SignupScreen-Widgets/widgets/send_otp_button.dart';
import 'SignupScreen-Widgets/widgets/whatsapp_checkbox.dart';
import 'SignupScreen-Widgets/widgets/terms_and_privacy.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const TopSection(), // ✅ Directly using Common-Widgets
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You're Almost There !",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Enter Mobile Number",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 15),

                          MobileInputField(controller: phoneController),
                          SizedBox(height: 20),

                          SendOtpButton(controller: controller, phoneController: phoneController),
                          SizedBox(height: 10),

                          WhatsappCheckbox(controller: controller),
                          SizedBox(height: 10),

                          const TermsAndPrivacyText(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
