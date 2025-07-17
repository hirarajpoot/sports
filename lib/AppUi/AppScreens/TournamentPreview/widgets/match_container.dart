import 'package:flutter/material.dart';

class MatchContainer extends StatelessWidget {
  final String team1;
  final String team2;
  final double opacity;

  const MatchContainer({
    super.key,
    required this.team1,
    required this.team2,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 136,
        width: 336,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE1DFF8), Color(0xFFF8DEDF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 8),
          ],
        ),
        child: Stack(
          children: [
            Positioned(left: 20, top: 16, child: _teamCircle(Colors.green, team1)),
            Positioned(right: 20, top: 16, child: _teamCircle(Colors.red, team2)),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: const Text(
                  'VS',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: const Text(
                  'Toss Winner - Kicks Off First',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamCircle(Color color, String teamName) {
    return Column(
      children: [
        Container(
          width: 47,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/football.png',
            width: 28,
            height: 27,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          teamName,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
