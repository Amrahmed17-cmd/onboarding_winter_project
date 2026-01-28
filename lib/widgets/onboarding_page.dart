import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_winter_project/constants/app_ui_constants.dart';
import 'package:onboarding_winter_project/resources/app_images.dart';
import 'package:onboarding_winter_project/resources/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppUiConstants.onboardingPages[pageIndex].image),
        SizedBox(height: 30),
        Text(
          AppUiConstants.onboardingPages[pageIndex].title,
          style: AppTextStyles.blackColor24ExtraBold,
        ),
        SizedBox(height: 10),
        Text(
          AppUiConstants.onboardingPages[pageIndex].description,
          textAlign: TextAlign.center,
          style: AppTextStyles.grey14SemiBold,
        ),
      ],
    );
  }
}
