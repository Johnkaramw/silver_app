import 'package:flutter/material.dart';
import 'package:silvar_app/pages/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silver App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const SplashScreen(), // ✅ يبدأ من Splash
    );
  }
}
