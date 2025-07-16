import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';

class ChallengeScreen extends StatelessWidget {
  final RxInt selectedTab = 0.obs;
  final List<String> tabs = ['Requests', 'Explore', 'Tournaments'];

  ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayer(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04,
                    vertical: h * 0.015,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Challenge',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Tabs
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(tabs.length, (index) {
                        bool isSelected = selectedTab.value == index;
                        return GestureDetector(
                          onTap: () => selectedTab.value = index,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 59,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2E8A57)
                                  : const Color(0xFFF3F0F0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),

                const SizedBox(height: 16),

                // Body
                Expanded(
                  child: Obx(() {
                    if (selectedTab.value == 0) {
                      return _buildRequestSection(w, h);
                    } else if (selectedTab.value == 1) {
                      return _buildExploreSection(w, h);
                    } else {
                      return _buildTournamentSection(w, h);
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- MATCH REQUESTS ----------------------
  Widget _buildRequestSection(double w, double h) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Challenge Requests",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _buildCardBase(
            w,
            h,
            title: "ARSENAL FC",
            subtitle: "Friendly Match",
            badgeWidget: _defaultBadge("Today, 7:00 PM"),
            date: "3:00 PM",
            location: "Stadium",
          ),
          const SizedBox(height: 16),
          _buildCardBase(
            w,
            h,
            title: "ARSENAL FC",
            subtitle: "Friendly Match",
            badgeWidget: _defaultBadge("Today, 7:00 PM"),
            date: "3:00 PM",
            location: "Stadium",
          ),
        ],
      ),
    );
  }

  // ---------------------- TOURNAMENT INVITES ----------------------
  Widget _buildTournamentSection(double w, double h) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tournament Invitations",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _buildCardBase(
            w,
            h,
            title: "CHELSEA FC",
            subtitle: "Knockout Tournament",
            badgeWidget: _tournamentBadge("£5,000"),
            date: "July 20, 2025",
            location: "Wembley Arena",
          ),
          const SizedBox(height: 16),
          _buildCardBase(
            w,
            h,
            title: "CHELSEA FC",
            subtitle: "Knockout Tournament",
            badgeWidget: _tournamentBadge("£5,000"),
            date: "July 20, 2025",
            location: "Wembley Arena",
          ),
        ],
      ),
    );
  }

  // ---------------------- EXPLORE NEARBY CLUBS ----------------------
  Widget _buildExploreSection(double w, double h) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nearby Clubs",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _buildClubCard(),
          const SizedBox(height: 16),
          _buildClubCard(),
          const SizedBox(height: 16),
          _buildClubCard(),
        ],
      ),
    );
  }

  Widget _buildClubCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 1st Row: Title + Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "ARSENAL FC",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.star, size: 18, color: Color(0xFFFFC107)),
                  SizedBox(width: 4),
                  Text(
                    "4.8",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),

          // 🔹 2nd Row: Distance + Members
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "2.3km",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Text(
                "45 Members",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 🔹 Challenge Button
          Center(
            child: SizedBox(
              width: 270,
              height: 43,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/match-setup',
                  ); // ✅ Change this to your actual route
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E8A57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Text(
                  "Challenge",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- SHARED WIDGETS ----------------------

  Widget _defaultBadge(String text) {
    return Container(
      width: 134,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD3CACA), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _tournamentBadge(String text) {
    return Container(
      width: 76,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x80FEF9C3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE3D21B),
        ),
      ),
    );
  }

  Widget _buildCardBase(
    double w,
    double h, {
    required String title,
    required String subtitle,
    required Widget badgeWidget,
    required String date,
    required String location,
  }) {
    return Container(
      width: 346,
      height: 208,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: h * 0.005),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 4.66,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              badgeWidget,
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    date,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_city_rounded, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    location,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 36,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/match-preview'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E8A57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Accept",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 140,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: const Text(
                          "Challenge Rejected",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: const Text(
                          "You have rejected the challenge request.",
                          style: TextStyle(fontFamily: 'Inter'),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2E8A57),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF1A1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Reject",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
