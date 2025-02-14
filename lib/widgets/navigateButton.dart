// import 'package:flutter/material.dart';

// class NavigationButtons extends StatelessWidget {
//   final VoidCallback onNextPressed;
//   final VoidCallback onSkipPressed;

//   const NavigationButtons({
//     super.key,
//     required this.onNextPressed,
//     required this.onSkipPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           onPressed: onSkipPressed,
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Colors.white,
//           ),
//           child: const Text("Skip",
//               style: TextStyle(fontSize: 16, color: Colors.blue)),
//         ),
//         ElevatedButton(
//           onPressed: onNextPressed,
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Colors.blue,
//           ),
//           child: const Text("Next",
//               style: TextStyle(fontSize: 18, color: Colors.white)),
//         ),
//       ],
//     );
//   }
// }
