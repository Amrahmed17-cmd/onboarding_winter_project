import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/common_use_cases/is_logged_in_use_case.dart';
import 'package:onboarding_winter_project/features/splash/domain/use_cases/is_visited_before_use_case.dart';
import 'package:onboarding_winter_project/core/common_state/screen_state.dart';

class SplashCubit extends Cubit<ScreenState> {
  SplashCubit(this._isVisitedBeforeUseCase, this._isLoggedInUseCase)
    : super(ScreenState.splash);
  final IsVisitedBeforeUseCase _isVisitedBeforeUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;

  Future<void> navigateToPage() async {
    await Future.delayed(Duration(seconds: 2));
    if (_isVisitedBeforeUseCase()) {
      if (_isLoggedInUseCase()) {
        emit(ScreenState.home);
      } else {
        emit(ScreenState.login);
      }
    } else {
      emit(ScreenState.onboarding);
    }
  }
}

/*
1-if loggedIn -> home
2-if not loggedIn but not first visit -> login -> -> save login state = true -> save user data
3-if not loggedIn and first visit -> onboarding -> save visitedBefore = true -> login

*/
