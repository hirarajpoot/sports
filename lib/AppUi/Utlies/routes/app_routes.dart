import 'package:get/get.dart';

import '../../AppScreens/splash_screen.dart';
import '../../AppScreens/splash.dart';
import '../../AppScreens/meet_screen.dart';
import '../../AppScreens/authScreens/signup_screen.dart';
import '../../AppScreens/authScreens/verify_otp_screen.dart';
import '../../AppScreens/authScreens/complete_profile_screen.dart';
import '../../AppScreens/home_screen.dart';
import '../../AppScreens/stats_screen.dart';
import '../../AppScreens/match_setup_screen.dart'; // ✅ MatchSetupScreen imported

class AppRoutes {
  static const String splashscreen = '/splashscreen';
  static const String splash = '/splash';
  static const String meet = '/meet';
  static const String signup = '/signup';
  static const String verifyOtp = '/verify-otp';
  static const String completeProfile = '/complete-profile';
  static const String home = '/home';
  static const String stats = '/stats';
  static const String matchSetup = '/match-setup'; // ✅ New route name added
  static const String next = '/next';

  static final pages = [
    GetPage(name: splashscreen, page: () => SplashScreen()),
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: meet, page: () => MeetScreen()),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 1200),
    ),
    GetPage(
      name: verifyOtp,
      page: () => VerifyOtpScreen(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 1200),
    ),
    GetPage(
      name: completeProfile,
      page: () => const CompleteProfileScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: stats,
      page: () => const StatsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: matchSetup,
      page: () => MatchSetupScreen(),
      transition: Transition.rightToLeft, // ✅ Transition added
      transitionDuration: Duration(milliseconds: 600),
    ),
  ];
}
