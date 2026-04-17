import 'package:flutter/material.dart';
import 'package:velotoulouse/main_common.dart';
import 'package:velotoulouse/ui/animations/splash_animation.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class SplashScreen extends StatefulWidget {
  final Future<void> Function() onInit;

  const SplashScreen({super.key, required this.onInit});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startInit();
  }

  Future<void> _startInit() async {
    await Future.wait([
      widget.onInit(),
      Future.delayed(const Duration(milliseconds: 3000)),
    ]);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: _Circle(size: 320, opacity: 0.10),
          ),
          Positioned(
            bottom: -60,
            right: -60,
            child: _Circle(size: 220, opacity: 0.08),
          ),
          Center(
            child: SplashAnimation(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.largeRadius,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Velo Toulouse",
                    style: AppText.h2.copyWith(
                      color: AppColors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Your city cycling companion",
                    style: AppText.body.copyWith(
                      color: AppColors.white.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final double opacity;

  const _Circle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}
