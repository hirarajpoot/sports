// club_details_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppUi/AppScreens/AddPlayersScreen-Widgets/widgets/background_layer.dart';
import '../Controllers/auth-controllers/club_controller.dart';
import '../Controllers/auth-controllers/club_details_controller.dart';
import '../AppScreens/ClubDetails/widgets/about_tab.dart';
import '../AppScreens/ClubDetails/widgets/app_bar_row.dart';
import '../AppScreens/ClubDetails/widgets/club_info_card.dart';
import '../AppScreens/ClubDetails/widgets/feed_tab.dart';
import '../AppScreens/ClubDetails/widgets/sponsor_tab.dart';    
import '../AppScreens/ClubDetails/widgets/tab_buttons.dart';


class ClubDetailsScreen extends StatelessWidget {
  const ClubDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clubCtrl = Get.find<ClubController>();
    final detailsCtrl = Get.put(ClubDetailsController());
    final club = clubCtrl.selectedClub.value;

    if (club == null) {
      return const Scaffold(
        body: Center(child: Text('No club Selected')),
      );
    }

    return Scaffold(
      body: Stack(children: [
        const BackgroundLayer(),
        SafeArea(
          child: Column(children: [
            const AppBarRow(),
            const SizedBox(height: 16),
            ClubInfoCard(club: club),
            const SizedBox(height: 16),
            TabButtons(controller: detailsCtrl),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                final idx = detailsCtrl.currentIndex.value;
                if (idx == 0) return AboutTab(club: club);
                if (idx == 1) return SponsorTab(club: club);
                return FeedTab(club: club);
              }),
            ),
          ]),
        ),
      ]),
    );
  }
}
