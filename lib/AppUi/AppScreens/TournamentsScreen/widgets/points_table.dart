import 'package:flutter/material.dart';

class PointsTable extends StatelessWidget {
  final double Function(double) scale;

  const PointsTable({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teams = ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'];
    final played = [10, 10, 10, 10, 10];
    final won = [8, 7, 6, 5, 4];
    final lost = [2, 3, 4, 5, 6];
    final gf = [25, 20, 18, 15, 12];

    return Container(
      padding: EdgeInsets.all(scale(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeaderRow(),
          Divider(thickness: 1, color: Colors.grey[300]),
          ...List.generate(teams.length, (index) {
            final isTopTeam = index == 0;
            return _buildDataRow(
              team: teams[index],
              played: played[index],
              won: won[index],
              lost: lost[index],
              gf: gf[index],
              isTopTeam: isTopTeam,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scale(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _headerCell('TEAM', flex: 3),
          _headerCell('P'),
          _headerCell('W'),
          _headerCell('L'),
          _headerCell('GF'),
        ],
      ),
    );
  }

  Widget _buildDataRow({
    required String team,
    required int played,
    required int won,
    required int lost,
    required int gf,
    required bool isTopTeam,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scale(12)),
      decoration: BoxDecoration(
        color: isTopTeam ? const Color(0xFFFFF9DB) : Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/alpha.png'),
                  radius: scale(16),
                ),
                SizedBox(width: scale(8)),
                Text(team, style: TextStyle(fontSize: scale(14))),
              ],
            ),
          ),
          _dataCell('$played'),
          _dataCell('$won'),
          _dataCell('$lost'),
          _dataCell('$gf'),
        ],
      ),
    );
  }

  Widget _headerCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _dataCell(String text) {
    return Expanded(
      child: Center(child: Text(text)),
    );
  }
}
