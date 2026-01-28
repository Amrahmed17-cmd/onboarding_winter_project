import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/resources/app_colors.dart';
import 'package:onboarding_winter_project/resources/app_text_styles.dart';

import '../constants/app_ui_constants.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({
    super.key,
    required this.pageIndex,
    required this.onPrevPressed,
    required this.onNextPressed,
  });

  final int pageIndex;
  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: pageIndex != 0,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: TextButton(
            onPressed: onPrevPressed,
            child: Text(
              'Prev'.padRight(11, ' '),
              style: AppTextStyles.blackColor18SemiBold.copyWith(
                color: AppColors.greyC4Color,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: AppUiConstants.onboardingPages
                .map(
                  (e) => AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    width:
                        pageIndex == AppUiConstants.onboardingPages.indexOf(e)
                        ? 40
                        : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          pageIndex == AppUiConstants.onboardingPages.indexOf(e)
                          ? AppColors.darkBlue17Color
                          : AppColors.darkBlue17ColorWithOpacity,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        TextButton(
          onPressed: onNextPressed,
          child: Text(
            pageIndex == AppUiConstants.onboardingPages.length - 1
                ? 'Get Started'
                : 'Next'.padLeft(11, ' '),
            style: AppTextStyles.blackColor18SemiBold.copyWith(
              color: AppColors.pinkF8Color,
            ),
          ),
        ),
      ],
    );
  }
}
