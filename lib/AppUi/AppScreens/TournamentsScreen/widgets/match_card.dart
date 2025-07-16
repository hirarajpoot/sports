import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final double Function(double) scale;
  final String label;
  final String teamA;
  final String teamB;
  final String imgA;
  final String imgB;
  final String time;
  final String? scoreA;
  final String? scoreB;
  final bool isLive;

  const MatchCard({
    Key? key,
    required this.scale,
    required this.label,
    required this.teamA,
    required this.teamB,
    required this.imgA,
    required this.imgB,
    required this.time,
    this.scoreA,
    this.scoreB,
    this.isLive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUpcoming = label == 'UPCOMING';

    return Container(
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
        border: isLive
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isUpcoming
                      ? Colors.blue
                      : (isLive ? Colors.red : Colors.grey),
                  fontWeight: FontWeight.bold,
                  fontSize: scale(14),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: scale(16),
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: scale(9.32)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/$imgA',
                    width: scale(32),
                    height: scale(32),
                  ),
                  SizedBox(width: scale(8)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Team',
                        style: TextStyle(
                          fontSize: scale(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        teamA,
                        style: TextStyle(
                          fontSize: scale(14),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              scoreA == null || scoreB == null
                  ? Text(
                      'vs',
                      style: TextStyle(
                        fontSize: scale(16),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      children: [
                        Text(
                          scoreA!,
                          style: TextStyle(
                            fontSize: scale(18),
                            fontWeight: FontWeight.bold,
                            color: isLive ? Colors.red : Colors.black,
                          ),
                        ),
                        Text(' - ', style: TextStyle(fontSize: scale(18))),
                        Text(
                          scoreB!,
                          style: TextStyle(
                            fontSize: scale(18),
                            fontWeight: FontWeight.bold,
                            color: isLive ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Team',
                        style: TextStyle(
                          fontSize: scale(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        teamB,
                        style: TextStyle(
                          fontSize: scale(14),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: scale(8)),
                  Image.asset(
                    'assets/images/$imgB',
                    width: scale(32),
                    height: scale(32),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
