import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/common_widgets/filter_button.dart';
import 'package:onboarding_winter_project/core/common_widgets/sort_button.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';

class AllFeaturedSection extends StatelessWidget {
  final VoidCallback? onSortPressed;
  final VoidCallback? onFilterPressed;

  const AllFeaturedSection({
    super.key,
    this.onSortPressed,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Featured',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              SortButton(onPressed: onSortPressed),
              SizedBox(width: 12),
              FilterButton(onPressed: onFilterPressed),
            ],
          ),
        ],
      ),
    );
  }
}
