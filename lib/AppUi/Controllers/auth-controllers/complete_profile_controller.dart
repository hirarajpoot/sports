import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_profile_model.dart';
import '../../Utlies/routes/app_routes.dart';

class CompleteProfileController extends GetxController {
  // User profile data
  var userProfile = UserProfile(
    firstName: "Itunuoluwa",
    lastName: "Abidoye",
    email: "itunuoluwa@example.com",
    phone: "+91-9876543210",
    profileImage: "assets/images/User image.png",
  ).obs;

  // Text controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Pre-fill text fields with user data
    firstNameController.text = userProfile.value.firstName;
    lastNameController.text = userProfile.value.lastName;
    emailController.text = userProfile.value.email;
    phoneController.text = userProfile.value.phone;
  }

  void updateProfile() {
    userProfile.value.firstName = firstNameController.text;
    userProfile.value.lastName = lastNameController.text;
    userProfile.value.email = emailController.text;
    userProfile.value.phone = phoneController.text;

    // TODO: API call to update profile
    print("Profile updated: ${userProfile.value.firstName}");
  }

  void goToNextScreen() {
    updateProfile();
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
