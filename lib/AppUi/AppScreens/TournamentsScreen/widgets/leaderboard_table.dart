import 'package:flutter/material.dart';

class LeaderboardTable extends StatelessWidget {
  final double Function(double) scale;

  const LeaderboardTable({super.key, required this.scale});

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
          ...List.generate(6, (index) => _buildDataRow(index)),
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

  TableRow _buildDataRow(int index) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scale(6),
            vertical: scale(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${index + 1}.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: scale(14),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: scale(10)),
                  child: Text(
                    '24',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                      fontSize: scale(14),
                    ),
                    textAlign: TextAlign.right,
                  ),
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
                'Team Alpha',
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
              '8',
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
