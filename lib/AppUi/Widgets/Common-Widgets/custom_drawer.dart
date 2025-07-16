import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;

  const CustomDrawer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            color: const Color(0xFF2E8A57),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/Ellipse 64.png',
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Hello, Guest User",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "guest@example.com",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2E8A57),
                      ),
                      child: const Text("Edit Profile"),
                    ),
                    const SizedBox(height: 24),

                    _drawerItem(Icons.home, "Home", () {
                      _navigateTo('/home');
                    }),
                    _drawerItem(Icons.group, "Profile", () {
                      _navigateTo('/complete-profile');
                    }),
                    _drawerItem(Icons.share, "Documents", () {}),
                    _drawerItem(Icons.alarm, "Match Preview", () {
                      _navigateTo('/match-preview');
                    }),
                    _drawerItem(
                        Icons.settings, "Delete Account", _onDeleteAccount),
                    const Spacer(),
                    _drawerItem(Icons.logout, "Log out", _onLogout),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container(color: Colors.transparent)),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      onTap: () {
        onClose();
        onTap();
      },
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  static void _navigateTo(String route) {
    Get.offAllNamed(route);
  }

  static void _onDeleteAccount() {
    Get.dialog(
      Center(
        child: Container(
          width: 281,
          height: 194, // ✅ Height preserved
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Delete Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E8A57),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure you want to delete your account? This action cannot be undone.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 111,
                    height: 27,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E8A57),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 111,
                    height: 27,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.back();
                        Get.dialog(
                          const Center(child: CircularProgressIndicator()),
                          barrierDismissible: false,
                        );
                        await Future.delayed(const Duration(seconds: 2));

                        bool success = true;

                        Get.back();
                        if (success) {
                          Get.snackbar(
                            "Account Deleted",
                            "Your account has been permanently deleted.",
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                          Get.offAllNamed('/login');
                        } else {
                          Get.snackbar(
                            "Error",
                            "Failed to delete account. Please try again later.",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF1A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        "Yes, Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void _onLogout() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await Future.delayed(const Duration(seconds: 1));

    Get.back();
    Get.snackbar(
      "Logged Out",
      "You have been successfully logged out.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offAllNamed('/login');
  }
}
