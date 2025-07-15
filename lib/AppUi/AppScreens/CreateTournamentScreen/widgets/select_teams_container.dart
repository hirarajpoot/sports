import 'package:flutter/material.dart';

class SelectTeamsContainer extends StatelessWidget {
  const SelectTeamsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Teams here',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 297,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            12,
            12,
            12,
            20,
          ), // ✅ Added bottom padding
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // ✅ Equal spacing
            children: [
              _rowBoxes('A', 'B'),
              _rowBoxes('C', 'D'),
              _rowBoxes('E', 'F'),
              _rowBoxes('G', 'H'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rowBoxes(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_teamBox('Select Team $left'), _teamBox('Select Team $right')],
    );
  }

  Widget _teamBox(String teamName) {
    return Container(
      width: 145,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xCCA4F2C7),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        teamName,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
