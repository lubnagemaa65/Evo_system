import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isFirstPage;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.isFirstPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isFirstPage
          ? [
              // const SizedBox(height: 70),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair Display',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ]
          : [
              Image.asset(image, height: 250),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Playfair Display',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ],
    );
  }
}
