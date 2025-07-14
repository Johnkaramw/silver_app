import 'package:flutter/material.dart';
import 'package:silvar_app/pages/home_page.dart';

void main() {
  runApp(const SilverApp());
}

class SilverApp extends StatelessWidget {
  const SilverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
