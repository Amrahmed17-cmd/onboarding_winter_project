import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/constants/app_ui_constants.dart';
import 'package:onboarding_winter_project/widgets/onboarding_page.dart';
import 'package:onboarding_winter_project/widgets/page_footer.dart';
import 'package:onboarding_winter_project/widgets/page_header.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageHeader(pageIndex: pageIndex),
              OnboardingPage(pageIndex: pageIndex),
              PageFooter(
                pageIndex: pageIndex,
                onPrevPressed: () {
                 setState(() {
                   pageIndex--;
                 });
                },
                onNextPressed: () {
                  if (pageIndex == AppUiConstants.onboardingPages.length - 1) {
                    //navigate to home
                  } else {
                    setState(() {
                      pageIndex++;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
