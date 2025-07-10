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
                children: [
                  _teamWithScore(
                    name: 'TEAM 1',
                    score: ctrl.score1.value,
                    borderColor: Colors.green,
                    onChanged: (val) => ctrl.score1.value = val,
                  ),
                  _teamWithScore(
                    name: 'TEAM 2',
                    score: ctrl.score2.value,
                    borderColor: Colors.red,
                    onChanged: (val) => ctrl.score2.value = val,
                  ),
                ],
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
          ],
        ),
      ),
    );
  }

  Widget _teamWithScore({
    required String name,
    required int score,
    required Color borderColor,
    required Function(int) onChanged,
  }) {
    final controller = TextEditingController(text: score.toString());
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
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Goal',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 42,
          height: 42,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: (v) => onChanged(int.tryParse(v) ?? 0),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
