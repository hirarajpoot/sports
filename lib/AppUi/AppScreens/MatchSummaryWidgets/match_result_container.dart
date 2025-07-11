import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/auth-controllers/match_summary_controller.dart';

class MatchResultContainer extends StatelessWidget {
  const MatchResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MatchSummaryController>();

    return Center(
      child: Container(
        width: 336,
        height: 409,
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 28,
              child: Text(
                'TEAM 1 Wins!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _teamScore('TEAM 1', ctrl.team1Score.value, Colors.green),
                  _teamScore('TEAM 2', ctrl.team2Score.value, Colors.red),
                ],
              ),
            ),
            Positioned(top: 200, child: _vsCircle()),
          ],
        ),
      ),
    );
  }

  Widget _teamScore(String team, int score, Color borderColor) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 10),
          ),
          child: ClipOval(
            child: Image.asset('assets/images/football.png', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          team,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$score',
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }

  Widget _vsCircle() {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: const Text(
        'VS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'Inter',
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
