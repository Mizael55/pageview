import 'package:flutter/material.dart';
import 'package:pageview/home.dart';
import 'package:pageview/omboardin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          OnboardingPage(
            title: 'Welcome to the app',
            subtitle: 'This is a description of the app',
            image: 'assets/1.jpg',
          ),
          OnboardingPage(
            title: 'Welcome to the app',
            subtitle: 'This is a description of the app',
            image: 'assets/2.jpg',
          ),
          OnboardingPage(
            title: 'Welcome to the app',
            subtitle: 'This is a description of the app',
            image: 'assets/3.jpg',
          ),
          OnboardingPage(
            title: 'Welcome to the app',
            subtitle: 'This is a description of the app',
            image: 'assets/4.jpg',
          ),
        ],
      ),
      // floating button to back and forward
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () {
              if (pageController.page == 3) {
                
                SharedPreferences.getInstance().then((preferences) {
                  preferences.setBool('seenOmboarding', true);
                });

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
