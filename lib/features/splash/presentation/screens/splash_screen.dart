import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_winter_project/core/resources/app_images.dart';
import 'package:onboarding_winter_project/core/router/routes.dart';
import 'package:onboarding_winter_project/core/utils/extensions/context_extension.dart';
import 'package:onboarding_winter_project/features/splash/presentation/splash_cubit/splash_cubit.dart';

import '../../../../core/common_state/screen_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, ScreenState>(
      listener: (context, state) {
        if (state == ScreenState.home) {
          context.navigateReplacement(Routes.home);
        } else if (state == ScreenState.login) {
          context.navigateReplacement(Routes.login);
        } else if (state == ScreenState.onboarding) {
          context.navigateReplacement(Routes.onBoarding);
        }
      },
      child: Scaffold(
        body: Center(child: SvgPicture.asset(AppImages.logoImage)),
      ),
    );
  }

  void _init() {
    context.read<SplashCubit>().navigateToPage();
  }
}
