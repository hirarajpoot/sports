import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth-controllers/match_preview_controller.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class MatchPreviewScreen extends StatelessWidget {
  const MatchPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(MatchPreviewController());
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 600;
    double baseFont(double size) => size * mq.textScaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 32 : 16,
                vertical: isWide ? 24 : 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      const Spacer(),
                      Text(
                        'Match Preview',
                        style: TextStyle(
                          fontSize: isWide ? 28 : 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Container(
                    width: 336,
                    height: 349,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _teamWithScore(
                              name: 'Team 1',
                              score: ctrl.score1.value,
                              borderColor: const Color(0xFF28EF81),
                              onChanged: ctrl.onScore1Changed,
                            ),
                            _vsCircle(isWide),
                            _teamWithScore(
                              name: 'Team 2',
                              score: ctrl.score2.value,
                              borderColor: const Color(0xFFFF0000),
                              onChanged: ctrl.onScore2Changed,
                            ),
                          ],
                        ),
                        Obx(
                          () => Text(
                            ctrl.status.value,
                            style: TextStyle(
                              fontSize: baseFont(14),
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoCardFixed('Players', ctrl.players.value, baseFont),
                      _infoCardFixed('Ground', ctrl.ground.value, baseFont),
                      _infoCardFixed('Duration', ctrl.duration.value, baseFont),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Obx(
                    () => Container(
                      width: double.infinity,
                      height: 79,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0x4D2E8A57),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 143,
                            height: 24,
                            child: Center(
                              child: Text(
                                ctrl.isReady.value
                                    ? 'Start Match'
                                    : 'Ready To Start',
                                style: TextStyle(
                                  fontSize: baseFont(16),
                                  color: const Color(0xFF2E8A57),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: 164,
                            height: 15,
                            child: Center(
                              child: Text(
                                'All team is ready for Kick‑Off',
                                style: TextStyle(
                                  fontSize: baseFont(12),
                                  color: const Color(0xFF2E8A57),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          width: 350,
          height: 56,
          child: ElevatedButton(
            onPressed: () => Get.toNamed('/next'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A9A5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/football.png',
                  width: 22,
                  height: 22,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Start Match',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // → Team column with border color and ball
  Widget _teamWithScore({
    required String name,
    required int score,
    required Color borderColor,
    required Function(int) onChanged,
  }) => Column(
    children: [
      Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 8),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/football.png',
            width: 45,
            height: 45,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
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
        ),
      ),
      const SizedBox(height: 6),
      SizedBox(
        width: 42,
        height: 42,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: score.toString()),
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

  // VS circle unchanged
  Widget _vsCircle(bool isWide) => Container(
    width: isWide ? 40 : 32,
    height: isWide ? 40 : 32,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade400),
    ),
    alignment: Alignment.center,
    child: const Text(
      'VS',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
    ),
  );

  // Info card with fixed size 93x79, new color and text
  Widget _infoCardFixed(
    String label,
    String value,
    double Function(double) baseFont,
  ) => Container(
    width: 93,
    height: 79,
    padding: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0x4D2E8A57),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: baseFont(12),
            color: const Color(0xFF2E8A57),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: baseFont(14),
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2E8A57),
          ),
        ),
      ],
    ),
  );
}
