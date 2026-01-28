import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/resources/app_colors.dart';
import 'package:onboarding_winter_project/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/splash_screen.dart';

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        fontFamily: AppTextStyles.fontFamily,
      ),
    );
  }
}
