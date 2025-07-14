import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/home_controller.dart';
import 'HomeScreen-Widgets/Widgets/bottom_nav_bar.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

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
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 32 : 16,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(
                              'assets/images/Ellipse 64.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 200,
                                height: 20,
                                child: Text(
                                  "Hi, Akshay!",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Color(0xFF8BC83F), // ✅ #8BC83F
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "Street, City, State, Zip Code, Country",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400, // Regular
                                      fontSize:
                                          12, // Slightly smaller for address
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      // 🔥 Right: Notification & Menu icons
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/bell.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/icons/menu.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _homeButton('Start Match'),
                        const SizedBox(width: 16),
                        _homeButton('Find Sponsors'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  _centeredPostCard(isWide),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _homeButton(String title) {
    return SizedBox(
      width: 146,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E8A57),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _centeredPostCard(bool isWide) {
    final RxBool isLiked = false.obs;

    return Center(
      child: Container(
        width: isWide ? 500 : double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/Ellipse 64.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Elite Club',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '2 hours ago',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Text(
              'What a thrilling match today between the Warriors and Titans! Unforgettable moments!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/match.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => isLiked.toggle(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt,
                          size: 20,
                          color: isLiked.value ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Like',
                          style: TextStyle(
                            fontSize: 13,
                            color: isLiked.value ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.comment_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Comment',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        'Share',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
