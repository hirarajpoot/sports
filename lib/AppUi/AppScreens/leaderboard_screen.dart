import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/leaderboard_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LeaderboardController());
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.05;
    final titleFontSize = size.width < 600 ? 20.0 : 28.0;

    return Scaffold(
      backgroundColor: Colors.white,
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

                  // 🟢 Tabs Row
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

                  // 🟢 Dynamic Content Based on Tab
                  Expanded(
                    child: Obx(() {
                      switch (ctrl.selectedIndex.value) {
                        case 0:
                          return _originalManOfTheMatchContent(ctrl);
                        case 1:
                          return _strikerContent();
                        case 2:
                          return _midfielderContent();
                        case 3:
                          return _goalkeeperContent();
                        default:
                          return const SizedBox();
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _originalManOfTheMatchContent(LeaderboardController ctrl) {
    return Column(
      children: [
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
                  border: Border.all(color: Colors.black, width: 0.82),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              const Spacer(),
              const Text(
                'Games',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              const SizedBox(width: 20),
              const Text(
                'Goals',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ],
          ),
        ),
        const Divider(height: 0),
        Expanded(
          child: ListView.builder(
            itemCount: ctrl.users.length,
            itemBuilder: (_, i) {
              final user = ctrl.users[i];
              return GestureDetector(
                onTap: () => ctrl.goToNextScreenIfFirst(i),
                child: Container(
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _strikerContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sports_soccer, size: 80, color: Colors.green),
          const SizedBox(height: 20),
          const Text(
            "Top Strikers of the Season!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Players who scored the most goals.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _midfielderContent() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: List.generate(5, (index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: Text("Midfielder ${index + 1}"),
            subtitle: const Text("Assist King of the match"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      }),
    );
  }

  Widget _goalkeeperContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sports_handball, size: 80, color: Colors.orange),
          const SizedBox(height: 20),
          const Text(
            "Top Goal Keepers",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Best keepers with clean sheets.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
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
