import 'package:get/get.dart';
import '../../Models/leaderboard_user_model.dart';

class LeaderboardController extends GetxController {
  final tabs = ['Man Of The Match', 'Striker', 'Midfielder', 'Goal Keeper'];
  final selectedIndex = 0.obs;

  final users = <LeaderboardUserModel>[
    LeaderboardUserModel(
      name: 'Lana Steiner',
      username: '@lana',
      image: 'assets/images/lona.png',
      games: 7,
      goals: 7,
    ),
    LeaderboardUserModel(
      name: 'Phoenix Baker',
      username: '@phoenix',
      image: 'assets/images/lona.png',
      games: 3,
      goals: 5,
    ),
    LeaderboardUserModel(
      name: 'Ella French',
      username: '@ella',
      image: 'assets/images/User image.png',
      games: 6,
      goals: 8,
    ),
    LeaderboardUserModel(
      name: 'Zara Khan',
      username: '@zara',
      image: 'assets/images/lona.png',
      games: 2,
      goals: 4,
    ),
    LeaderboardUserModel(
      name: 'Ahmed Raza',
      username: '@ahmed',
      image: 'assets/images/lona.png',
      games: 7,
      goals: 10,
    ),
  ].obs; // 🟢 Make this reactive here

  void goToNextScreenIfFirst(int index) {
    if (index == 0) {
      Get.toNamed('/match-screen');
    }
  }
}
