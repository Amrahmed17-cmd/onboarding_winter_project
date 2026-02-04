import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/di/module.dart';
import 'package:onboarding_winter_project/core/router/routes.dart';
import 'package:onboarding_winter_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:onboarding_winter_project/features/auth/presentation/screens/login_screen.dart';
import 'package:onboarding_winter_project/features/home/presentation/screens/main_screen.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/onboarding_cubit/onboarding_cubit.dart';
import 'package:onboarding_winter_project/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:onboarding_winter_project/features/splash/presentation/screens/splash_screen.dart';
import 'package:onboarding_winter_project/features/splash/presentation/splash_cubit/splash_cubit.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SplashCubit>(
            create: (context) => getIt<SplashCubit>(),
            child: SplashScreen(),
          ),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<OnboardingCubit>(
            create: (context) => getIt(),
            child: OnboardingScreen(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (context) => MainScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic>? undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          Scaffold(body: Center(child: Text('Undefined route'))),
    );
  }
}
