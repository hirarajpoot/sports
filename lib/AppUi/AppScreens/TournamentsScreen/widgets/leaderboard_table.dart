import 'package:flutter/material.dart';

class LeaderboardTable extends StatelessWidget {
  final double Function(double) scale;
  final List<Map<String, dynamic>> leaderboard;

  const LeaderboardTable({
    super.key,
    required this.scale,
    required this.leaderboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(scale(16)),
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
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          verticalInside: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1.6),
          1: FlexColumnWidth(2.5),
          2: FlexColumnWidth(1),
        },
        children: [
          _buildHeaderRow(),
          ...leaderboard.map((team) => _buildDataRow(team)).toList(),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      children: [
        _tableCell('Rank Points', isHeader: true),
        _tableCell('Team Name', isHeader: true),
        _tableCell('Won', isHeader: true),
      ],
    );
  }

  TableRow _buildDataRow(Map<String, dynamic> team) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scale(6),
            vertical: scale(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${team['rankPoints']}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: scale(14),
                ),
              ),
              Text(
                '${team['rankPoints']} pts',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  fontSize: scale(14),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: scale(12)),
          child: Column(
            children: [
              CircleAvatar(
                radius: scale(20),
                backgroundImage: AssetImage('assets/images/alpha.png'),
              ),
              SizedBox(height: scale(4)),
              Text(
                team['team'],
                style: TextStyle(
                  fontSize: scale(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: scale(12)),
          child: Center(
            child: Text(
              '${team['won']}',
              style: TextStyle(fontSize: scale(14)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tableCell(String text, {bool isHeader = false}) {
    return SizedBox(
      height: scale(20),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: scale(13),
          ),
        ),
      ),
    );
  }
}
