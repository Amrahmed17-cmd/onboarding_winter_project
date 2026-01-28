import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/common_widgets/app_rich_text.dart';
import 'package:onboarding_winter_project/constants/app_ui_constants.dart';
import 'package:onboarding_winter_project/resources/app_text_styles.dart';

import '../resources/app_colors.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRichText(
          originalText: '${pageIndex + 1}',
          highlightedText: '/${AppUiConstants.onboardingPages.length}',
          originalTextStyle: AppTextStyles.blackColor18SemiBold,
          highlightedTextStyle: AppTextStyles.blackColor18SemiBold.copyWith(
            color: AppColors.greyA0Color,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Skip', style: AppTextStyles.blackColor18SemiBold),
        ),
      ],
    );
  }
}
