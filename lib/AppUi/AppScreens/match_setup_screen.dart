// lib/AppScreens/match_setup_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchSetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 600;

    double baseFont(double size) => size * (mq.textScaleFactor);

    final edge = EdgeInsets.symmetric(
      horizontal: isWide ? mq.size.width * 0.2 : 24,
      vertical: 16,
    );

    Widget numberButton(String label, VoidCallback onTap) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: baseFont(16),
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black87),
        title: Text(
          'Match setup',
          style: TextStyle(
            fontSize: baseFont(20),
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/ground.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: edge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight + 16),
                Text(
                  'Configure Match',
                  style: TextStyle(
                    fontSize: baseFont(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 24),

                // Number of Players
                Text(
                  'Number of Players per Side *',
                  style: TextStyle(
                    fontSize: baseFont(16),
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    numberButton('5', () {}),
                    numberButton('7', () {}),
                    numberButton('11', () {}),
                    numberButton('Custom', () {}),
                  ],
                ),
                SizedBox(height: 24),

                // Type of Ground
                Text(
                  'Type of Ground *',
                  style: TextStyle(
                    fontSize: baseFont(16),
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(
                        'Select ground type',
                        style: TextStyle(fontSize: baseFont(16)),
                      ),
                      items: ['Grass', 'Turf', 'Indoor']
                          .map(
                            (v) => DropdownMenuItem(
                              value: v,
                              child: Text(
                                v,
                                style: TextStyle(fontSize: baseFont(16)),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Total Minutes *',
                  style: TextStyle(
                    fontSize: baseFont(16),
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    numberButton('10', () {}),
                    numberButton('7', () {}),
                    numberButton('11', () {}),
                    numberButton('Custom', () {}),
                  ],
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/team_selection');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: Color(0xFF227D34), // ✅ Corrected
                    ),
                    child: Text(
                      'Continue to Team selection',
                      style: TextStyle(
                        fontSize: baseFont(16),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
