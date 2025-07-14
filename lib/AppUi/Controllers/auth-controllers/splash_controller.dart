import 'package:get/get.dart';
import '../../Utlies/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _proceed();
  }

  void _proceed() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.meet);
  }
}
