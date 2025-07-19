import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/tournament_match_model.dart';
import '../../../Controllers/auth-controllers/tournaments_controller.dart';

class MatchCard extends StatelessWidget {
  final TournamentMatchModel match;

  MatchCard({super.key, required this.match});

  final TournamentsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    double scale(double px) => px / 375 * w;
    final isUpcoming = match.label == 'UPCOMING';

    return GestureDetector(
      // onTap: isUpcoming
          // ? () => controller.navigateToChallengeScreen(match)
          // : null,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: scale(16)),
        padding: EdgeInsets.all(scale(18.64)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(scale(9.32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: scale(6),
              offset: Offset(0, scale(4)),
            ),
          ],
          border: match.isLive
              ? Border(
                  left: BorderSide(
                    color: const Color(0xFFEF4444),
                    width: scale(4.66),
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  match.label,
                  style: TextStyle(
                    color: isUpcoming
                        ? Colors.blue
                        : (match.isLive ? Colors.red : Colors.grey),
                    fontWeight: FontWeight.bold,
                    fontSize: scale(14),
                  ),
                ),
                Text(
                  match.time,
                  style: TextStyle(
                    fontSize: scale(16),
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: scale(9.32)),
            // Teams Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _teamInfo(scale, match.imgA, match.teamA, true),
                match.scoreA == null || match.scoreB == null
                    ? Text(
                        'vs',
                        style: TextStyle(
                          fontSize: scale(16),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        '${match.scoreA} - ${match.scoreB}',
                        style: TextStyle(
                          fontSize: scale(18),
                          fontWeight: FontWeight.bold,
                          color: match.isLive ? Colors.red : Colors.black,
                        ),
                      ),
                _teamInfo(scale, match.imgB, match.teamB, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamInfo(
      double Function(double) scale, String img, String team, bool isLeft) {
    return Row(
      children: [
        if (isLeft)
          Image.asset('assets/images/$img',
              width: scale(32), height: scale(32)),
        SizedBox(width: scale(8)),
        Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              'Team',
              style: TextStyle(fontSize: scale(12), fontWeight: FontWeight.w600),
            ),
            Text(
              team,
              style: TextStyle(fontSize: scale(14), fontWeight: FontWeight.w600),
            ),
          ],
        ),
        if (!isLeft)
          Image.asset('assets/images/$img',
              width: scale(32), height: scale(32)),
      ],
    );
  }
}
