import 'package:flutter/material.dart';
import 'package:pageview/home.dart';
import 'package:pageview/onboardin.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final seenOmboarding = preferences.getBool('seenOmboarding') ?? false;
  runApp( MyApp(
    seenOmboarding: seenOmboarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOmboarding});
  final bool seenOmboarding;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PageView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: seenOmboarding ? const HomePage() : const OnboardingScreen(),
    );
  }
}
