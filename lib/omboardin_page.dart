import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
