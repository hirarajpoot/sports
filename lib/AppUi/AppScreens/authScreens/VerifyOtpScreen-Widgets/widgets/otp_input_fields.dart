import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/auth-controllers/verify_otp_controller.dart';

class OtpInputFields extends StatelessWidget {
  const OtpInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController controller = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Obx(
          () => SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: TextStyle(
                fontSize: 20,
                color: controller.otpDigits[index].isNotEmpty
                    ? Colors.white
                    : Colors.black,
              ),
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: controller.otpDigits[index].isNotEmpty
                    ? Colors.green
                    : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                controller.onOtpChanged(index, value);
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
