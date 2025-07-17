// class CreateClubButtons extends StatelessWidget {
//   final VoidCallback onNext;
//   final VoidCallback onCancel;

//   const CreateClubButtons({
//     super.key,
//     required this.onNext,
//     required this.onCancel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         SizedBox(
//           width: 151,
//           height: 53,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF2E8A50),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             onPressed: onNext,
//             child: const Text(
//               "Next",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 151,
//           height: 53,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             onPressed: onCancel,
//             child: const Text(
//               "Cancel",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
