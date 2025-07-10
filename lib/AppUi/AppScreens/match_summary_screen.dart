import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class MatchSummaryScreen extends StatelessWidget {
  MatchSummaryScreen({super.key});

  final RxInt team1Score = 4.obs;
  final RxInt team2Score = 7.obs;
  final RxString manOfTheMatch = 'TEAM 1'.obs;
  final RxString position = 'Midfielder'.obs;
  final RxList<Map<String, String>> goalScorers = [
    {
      'minute': '1’',
      'position': 'Midfielder',
      'team': 'Team 1',
      'name': 'Mike Smith',
    },
    {
      'minute': '1’',
      'position': 'Defender',
      'team': 'Team 1',
      'name': 'Alex Johnson',
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
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
                        const Text(
                          'Match Summary',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Inter',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Footballs Container
                    _matchResultContainer(),

                    const SizedBox(height: 16),

                    // Man of the Match Card
                    _manOfTheMatchCard(),

                    const SizedBox(height: 16),

                    // Goal Scorers List
                    _goalScorersList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchResultContainer() {
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
                  _teamScore('TEAM 1', team1Score.value, Colors.green),
                  const SizedBox(width: 20),
                  _teamScore('TEAM 2', team2Score.value, Colors.red),
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
        Container(
          width: 88,
          height: 29,
          alignment: Alignment.center,
          child: Text(
            team,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 80,
          alignment: Alignment.center,
          child: Text(
            '$score',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }

  static Widget _vsCircle() {
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

  Widget _manOfTheMatchCard() {
    return Container(
      width: 336,
      height: 449,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF97A2B7), // ✅ Updated BG color
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 4),
            blurRadius: 50,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Man of the Match',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 98,
            height: 98,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x4DFFFFFF),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/trophy 1.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            manOfTheMatch.value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            position.value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
              Icon(Icons.star, color: Colors.amber, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _goalScorersList() {
    return Container(
      width: 336,
      height: 286,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x262E8A57), Color(0x26FFFFFF)],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Goal Scorers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 8),
          ...goalScorers.asMap().entries.map(
            (entry) => _goalScorerCard(
              entry.value['minute'] ?? '',
              entry.value['position'] ?? '',
              entry.value['team'] ?? '',
              entry.value['name'] ?? '',
              isTopBox: entry.key == 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _goalScorerCard(
    String minute,
    String position,
    String team,
    String playerName, {
    bool isTopBox = false,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/nextScreen');
      },
      child: Container(
        width: 330,
        height: 79,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFF2E8A57), width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/football.png', width: 32, height: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    '$minute - $position',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    team,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  size: 18,
                  color: isTopBox ? Colors.amber : Colors.transparent,
                  shadows: isTopBox
                      ? []
                      : [Shadow(color: Colors.grey.shade400, blurRadius: 1)],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
