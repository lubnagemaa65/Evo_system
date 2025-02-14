import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
  final int index;
  final int currentPage;

  const BuildDot({super.key, required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: currentPage == index ? 6 : 4,
      height: currentPage == index ? 8 : 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
