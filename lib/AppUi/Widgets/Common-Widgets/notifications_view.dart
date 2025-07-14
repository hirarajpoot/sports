import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  final VoidCallback onClose;

  const NotificationsView({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Row(
        children: [
          Expanded(child: Container(color: Colors.transparent)),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E8A57),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Match invite from Tigers"),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Reminder: Game at 6pm"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
