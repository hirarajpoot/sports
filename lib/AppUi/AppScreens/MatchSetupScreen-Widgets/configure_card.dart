import 'package:flutter/material.dart';
import 'number_button.dart';

class ConfigureCard extends StatelessWidget {
  final bool isWide;
  const ConfigureCard({super.key, required this.isWide});

  @override
  Widget build(BuildContext c) {
    final mq = MediaQuery.of(c);
    baseFont(size) => size * mq.textScaleFactor;
    return Container(
      width: double.infinity,
      height: 468,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x33D9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(child: Text('Configure Match', style: TextStyle(fontSize: baseFont(18), fontWeight: FontWeight.bold))),
        const SizedBox(height: 113),
        Text('Number of Players per Side *', style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(children: [
          NumberButton(label: '5', isWide: isWide),
          NumberButton(label: '7', isWide: isWide),
          NumberButton(label: '11', isWide: isWide),
          NumberButton(label: 'Custom', isWide: isWide),
        ]),
        const SizedBox(height: 24),
        Text('Type of Ground *', style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select ground type', style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold)),
              items: ['Grass', 'Turf', 'Indoor'].map((v) =>
                DropdownMenuItem(value: v, child: Text(v, style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold))))
                .toList(),
              onChanged: (_) {},
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Total Minutes *', style: TextStyle(fontSize: baseFont(16), fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(children: [
          NumberButton(label: '10', isWide: isWide),
          NumberButton(label: '7', isWide: isWide),
          NumberButton(label: '11', isWide: isWide),
          NumberButton(label: 'Custom', isWide: isWide),
        ]),
      ]),
    );
  }
}
