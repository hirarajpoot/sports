import 'package:get/get.dart';
import '../../AppScreens/authScreens/signup_screen.dart';

class MeetController extends GetxController {
  void goToNextScreen() {
    Get.to(
      () => SignupScreen(),
      transition: Transition.downToUp, 
      duration: Duration(seconds: 60),
    );
  }
}
