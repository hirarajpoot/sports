// // club_details_widgets.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../Models/club_model.dart';
// import '../../../Controllers/auth-controllers/club_details_controller.dart';

// class AppBarRow extends StatelessWidget {
//   const AppBarRow({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Row(
//     children: [
//       IconButton(
//         icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//         onPressed: () => Get.back(),
//       ),
//       const Expanded(
//         child: Center(
//           child: Text(
//             'Club Details',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Inter',
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(width: 48),
//     ],
//   );
// }

// class ClubInfoCard extends StatelessWidget {
//   final Club club;
//   const ClubInfoCard({required this.club, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 346,
//       height: 128,
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             offset: const Offset(0, 2),
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // 🧾 Top Row: Image + Club Info
//           Row(
//             children: [
//               ClipOval(
//                 child: Image.asset(
//                   club.imagePath,
//                   width: 40,
//                   height: 40,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     club.name,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     club.matchType,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           const Spacer(),

//           // 👥 Bottom Right: Members & Admin
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 '${club.members} Members',
//                 style: const TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//               const SizedBox(width: 12),
//               const Text(
//                 'Admin',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF2E8A50),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TabButtons extends StatelessWidget {
//   final ClubDetailsController controller;
//   final tabs = ['About', 'Sponsor', 'Feed'];
//   TabButtons({required this.controller, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Obx(
//     () => Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(tabs.length, (i) {
//         final sel = controller.currentIndex.value == i;
//         return GestureDetector(
//           onTap: () => controller.selectTab(i),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
//             decoration: BoxDecoration(
//               color: sel ? const Color(0xFF2E8A50) : const Color(0xFFE0E0E0),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               tabs[i],
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: sel ? Colors.white : Colors.black54,
//               ),
//             ),
//           ),
//         );
//       }),
//     ),
//   );
// }

// class AboutTab extends StatelessWidget {
//   final Club club;
//   const AboutTab({required this.club, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => SingleChildScrollView(
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     child: Text(club.about, style: const TextStyle(fontSize: 14)),
//   );
// }

// class SponsorTab extends StatelessWidget {
//   final Club club;
//   const SponsorTab({required this.club, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Center(
//     child: Text(
//       'Sponsors for ${club.name}',
//       style: const TextStyle(color: Colors.grey),
//     ),
//   );
// }

// class FeedTab extends StatelessWidget {
//   final Club club;
//   const FeedTab({required this.club, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Center(
//     child: Text(
//       'Feed for ${club.name}',
//       style: const TextStyle(color: Colors.grey),
//     ),
//   );
// }
