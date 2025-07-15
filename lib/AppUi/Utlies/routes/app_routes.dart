import 'package:get/get.dart';

// Screens
import '../../AppScreens/splash.dart';
import '../../AppScreens/meet_screen.dart';
import '../../AppScreens/authScreens/signup_screen.dart';
import '../../AppScreens/authScreens/verify_otp_screen.dart';
import '../../AppScreens/authScreens/complete_profile_screen.dart';
import '../../AppScreens/home_screen.dart';
import '../../AppScreens/stats_screen.dart';
import '../../AppScreens/match_setup_screen.dart';
import '../../AppScreens/team_selection_screen.dart';
import '../../AppScreens/add_players_screen.dart';
import '../../AppScreens/match_start_screen.dart';
import '../../AppScreens/match_preview_screen.dart';
import '../../AppScreens/live_match_screen.dart';
import '../../AppScreens/match_summary_screen.dart';
import '../../AppScreens/leaderboard_screen.dart';
import '../../AppScreens/match_screen.dart';
import '../../AppScreens/create_tournament_screen.dart';
import '../../AppScreens/tournament_preview_screen.dart'; // ✅ Imported TournamentPreviewScreen

class AppRoutes {
  static const String splashscreen = '/splashscreen';
  static const String splash = '/splash';
  static const String meet = '/meet';
  static const String signup = '/signup';
  static const String verifyOtp = '/verify-otp';
  static const String completeProfile = '/complete-profile';
  static const String home = '/home';
  static const String stats = '/stats';
  static const String matchSetup = '/match-setup';
  static const String teamSelection = '/team_selection';
  static const String addPlayers = '/add-players';
  static const String matchStart = '/match-start';
  static const String matchPreview = '/match-preview';
  static const String liveMatch = '/live-match';
  static const String matchSummary = '/match-summary';
  static const String leaderboard = '/leaderboard';
  static const String matchScreen = '/match-screen';
  static const String createTournament = '/create-tournament';
  static const String tournamentPreview = '/tournament-preview'; // ✅ New route

  static final pages = [
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: meet, page: () => MeetScreen()),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: verifyOtp,
      page: () => VerifyOtpScreen(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 1200),
    ),
    GetPage(
      name: completeProfile,
      page: () => const CompleteProfileScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: stats,
      page: () => const StatsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: matchSetup,
      page: () => MatchSetupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: teamSelection,
      page: () => TeamSelectionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: addPlayers,
      page: () => const AddPlayersScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: matchStart,
      page: () => const MatchStartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: matchPreview,
      page: () => const MatchPreviewScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: liveMatch,
      page: () => const LiveMatchScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: matchSummary,
      page: () => MatchSummaryScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: leaderboard,
      page: () => LeaderboardScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: matchScreen,
      page: () => const MatchScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: createTournament,
      page: () => CreateTournamentScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      // ✅ Registered TournamentPreviewScreen
      name: tournamentPreview,
      page: () => const TournamentPreviewScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
