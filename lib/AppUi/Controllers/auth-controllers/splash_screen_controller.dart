import 'package:get/get.dart';
import '../../Utlies/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToSplash();
  }

  void _navigateToSplash() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.splash);
  }
}
