import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class LeaderboardUserModel {
  final String name;
  final String username;
  final String image;
  final int games;
  final int goals;

  LeaderboardUserModel({
    required this.name,
    required this.username,
    required this.image,
    required this.games,
    required this.goals,
  });
}

class LeaderboardController extends GetxController {
  final tabs = ['Man Of The Match', 'Striker', 'Midfielder', 'Goal Keeper'];
  final selectedIndex = 0.obs;
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LeaderboardController());
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.05;
    final titleFontSize = size.width < 600 ? 20.0 : 28.0;

    final List<LeaderboardUserModel> users = [
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
        name: 'Phoenix Baker',
        username: '@phoenix',
        image: 'assets/images/lona.png',
        games: 3,
        goals: 5,
      ),

      LeaderboardUserModel(
        name: 'Phoenix Baker',
        username: '@phoenix',
        image: 'assets/images/lona.png',
        games: 3,
        goals: 5,
      ),

      LeaderboardUserModel(
        name: 'Phoenix Baker',
        username: '@phoenix',
        image: 'assets/images/lona.png',
        games: 3,
        goals: 5,
      ),

      LeaderboardUserModel(
        name: 'Phoenix Baker',
        username: '@phoenix',
        image: 'assets/images/lona.png',
        games: 3,
        goals: 5,
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
    ];

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Expanded(
                        child: Text(
                          'Leaders Board',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(ctrl.tabs.length, (index) {
                          final isSel = ctrl.selectedIndex.value == index;
                          return GestureDetector(
                            onTap: () => ctrl.selectedIndex.value = index,
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    ctrl.tabs[index],
                                    style:
                                        const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ).copyWith(
                                          color: isSel
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  if (isSel)
                                    Container(
                                      height: 2,
                                      width: _getTextWidth(
                                        ctrl.tabs[index],
                                        const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      color: Colors.green,
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// ✅ Header Row with checkbox
                  Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.82,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Games',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Goals',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (_, i) {
                        final user = users[i];
                        return Container(
                          height: 59,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Center(
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(user.image),
                                onBackgroundImageError: (_, __) => debugPrint(
                                  'Image not found: ${user.image}',
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      user.username,
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${user.games}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${user.goals}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getTextWidth(String text, TextStyle style) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.width;
  }
}
