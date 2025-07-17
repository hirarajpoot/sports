import 'package:flutter/material.dart';

class PointsTable extends StatelessWidget {
  final double Function(double) scale;
  final List<Map<String, dynamic>> pointsTable;

  const PointsTable({
    super.key,
    required this.scale,
    required this.pointsTable,
  });

  @override
  Widget build(BuildContext context) {
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
          ...pointsTable.asMap().entries.map((entry) {
            final index = entry.key;
            final team = entry.value;
            return _buildDataRow(team, isTopTeam: index == 0);
          }).toList(),
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

  Widget _buildDataRow(Map<String, dynamic> team, {required bool isTopTeam}) {
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
                Text(team['team'], style: TextStyle(fontSize: scale(14))),
              ],
            ),
          ),
          _dataCell('${team['played']}'),
          _dataCell('${team['won']}'),
          _dataCell('${team['lost']}'),
          _dataCell('${team['gf']}'),
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
