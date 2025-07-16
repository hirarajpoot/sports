import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/home_controller.dart';
import '../AppScreens/HomeScreen-Widgets/Widgets/greeting_header.dart';
import '../AppScreens/HomeScreen-Widgets/Widgets/action_buttons.dart';
import '../AppScreens/HomeScreen-Widgets/Widgets/post_card.dart';
import '../Widgets/Common-Widgets/custom_drawer.dart';
import '../AppScreens/HomeScreen-Widgets/Widgets/bottom_nav_bar.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final RxBool showDrawer = false.obs;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 32 : 16, vertical: 16),
              child: Column(
                children: [
                  GreetingHeader(showDrawer: showDrawer),
                  const SizedBox(height: 40),
                  const ActionButtons(),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Obx(() {
                      final posts = controller.posts;
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return PostCard(post: posts[index]);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => showDrawer.value
              ? CustomDrawer(onClose: () => showDrawer.value = false)
              : const SizedBox.shrink()),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
