import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/live_match_controller.dart';
import '../match_preview_widgets/vs_circle.dart';

class MatchContainer extends StatelessWidget {
  const MatchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<LiveMatchController>();

    return Center(
      child: Container(
        width: 336,
        height: 350,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(77, 173, 173, 253),
              Color.fromARGB(77, 253, 195, 195),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          // ✅ Add shadow ONLY to bottom border
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.2), // Shadow color
              width: 4, // Thickness of shadow
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 28,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_teamLogo(isLeft: true), _teamLogo(isLeft: false)],
              ),
            ),
            Positioned(top: 150, child: const VsCircle(isWide: false)),
            const Positioned(
              top: 150 + 44 + 19,
              child: Text(
                'Live',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            // 🔥 Scores & Buttons
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _scoreWithButtons(
                    score: ctrl.score1,
                    increment: ctrl.incrementScore1,
                    decrement: ctrl.decrementScore1,
                  ),
                  _scoreWithButtons(
                    score: ctrl.score2,
                    increment: ctrl.incrementScore2,
                    decrement: ctrl.decrementScore2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamLogo({required bool isLeft}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isLeft ? Colors.green : Colors.red,
          width: 10,
        ),
      ),
      child: ClipOval(
        child: Image.asset('assets/images/football.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget _scoreWithButtons({
    required RxInt score,
    required VoidCallback increment,
    required VoidCallback decrement,
  }) {
    return Column(
      children: [
        // Score Text
        Obx(
          () => Container(
            width: 38,
            height: 73,
            alignment: Alignment.center,
            child: Text(
              '${score.value}',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 60,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // ➖ ➕ Buttons
        Row(
          children: [
            _circleButton(
              icon: '-',
              bgColor: const Color(0xFFFF0000),
              textColor: Colors.white,
              onTap: decrement,
            ),
            const SizedBox(width: 6),
            _circleButton(
              icon: '+',
              bgColor: Colors.white,
              textColor: Colors.black,
              onTap: increment,
            ),
          ],
        ),
      ],
    );
  }

  Widget _circleButton({
    required String icon,
    required Color bgColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 33,
      height: 33,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          elevation: 2,
        ),
        child: Text(
          icon,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
