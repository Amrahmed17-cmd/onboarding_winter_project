import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/common_state/screen_state.dart';
import 'package:onboarding_winter_project/core/constants/app_ui_constants.dart';
import 'package:onboarding_winter_project/core/router/routes.dart';
import 'package:onboarding_winter_project/core/utils/extensions/context_extension.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/onboarding_cubit/onboarding_cubit.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/widgets/page_footer.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/widgets/page_header.dart';

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
                    var onboardingCubit = context.read<OnboardingCubit>();
                    onboardingCubit.setVisitedBefore(true);
                    context.navigateReplacement(Routes.login);
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
