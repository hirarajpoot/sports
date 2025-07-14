import 'package:flutter/material.dart';

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
            color: const Color(0xFF2E8A57), // Green background
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
                    _drawerItem(Icons.home, "Home", () {}),
                    _drawerItem(Icons.group, "Contact", () {}),
                    _drawerItem(Icons.share, "Documents", () {}),
                    _drawerItem(Icons.alarm, "Set Reminder", () {}),
                    _drawerItem(Icons.settings, "Delete Account", () {}),
                    const Spacer(),
                    _drawerItem(Icons.logout, "Log out", () {}),
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
      onTap: onTap,
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
