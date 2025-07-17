import 'package:get/get.dart';
import '../../Models/challenge_request_model.dart';
import '../../Models/explore_club_model.dart';
import '../../Models/tournament_invite_model.dart';
import 'package:flutter/material.dart';

class ChallengeController extends GetxController {
  RxInt selectedTab = 0.obs;

  final List<String> tabs = ['Requests', 'Explore', 'Tournaments'];

  final List<ChallengeRequestModel> challengeRequests = [
    ChallengeRequestModel(
      teamName: "Arsenal FC",
      matchType: "Friendly Match",
      time: "Today, 7:00 PM",
      date: "3:00 PM",
      location: "Stadium",
    ),
    ChallengeRequestModel(
      teamName: "Chelsea FC",
      matchType: "Friendly Match",
      time: "Tomorrow, 5:00 PM",
      date: "5:00 PM",
      location: "Arena",
    ),
  ];

  final List<ExploreClubModel> nearbyClubs = [
    ExploreClubModel(
      name: "Arsenal FC",
      rating: 4.8,
      distance: "2.3km",
      members: "45 Members",
    ),
    ExploreClubModel(
      name: "Chelsea FC",
      rating: 4.6,
      distance: "3.1km",
      members: "52 Members",
    ),
    ExploreClubModel(
      name: "Liverpool FC",
      rating: 4.7,
      distance: "4.0km",
      members: "39 Members",
    ),
  ];

  final List<TournamentInviteModel> tournamentInvites = [
    TournamentInviteModel(
      teamName: "Chelsea FC",
      tournamentType: "Knockout Tournament",
      prize: "£5,000",
      date: "July 20, 2025",
      location: "Wembley Arena",
    ),
    TournamentInviteModel(
      teamName: "Arsenal FC",
      tournamentType: "League Tournament",
      prize: "£3,000",
      date: "Aug 15, 2025",
      location: "Emirates Stadium",
    ),
  ];

  void rejectChallenge() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Challenge Rejected"),
        content: const Text("You have rejected the challenge request."),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              "OK",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xFF2E8A57)),
            ),
          ),
        ],
      ),
    );
  }
}
