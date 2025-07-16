import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية المتدرجة
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFECE9E6), Color(0xFFFFFFFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // الصورة الخلفية الشفافة
        Positioned.fill(
          child: Opacity(
            opacity: 0.08, // درجة الشفافية
            child: Image.asset(
              'assets/images/coin.png', // لازم تكون صورة شفافة (PNG) موجودة في assets
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
            ),
          ),
        ),

        // المحتوى الأساسي
        SafeArea(child: child),
      ],
    );
  }
}
