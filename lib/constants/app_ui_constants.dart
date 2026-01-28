import 'package:onboarding_winter_project/resources/app_images.dart';
import 'package:onboarding_winter_project/ui_model/page_ui_model.dart';

class AppUiConstants {
  AppUiConstants._();

  static final List<PageUiModel> onboardingPages = [
    PageUiModel(
      title: 'Choose Products',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onboarding1,
    ),
    PageUiModel(
      title: 'Make Payment',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onboarding2,
    ),
    PageUiModel(
      title: 'Get Your Order',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onboarding3,
    ),
  ];
}
