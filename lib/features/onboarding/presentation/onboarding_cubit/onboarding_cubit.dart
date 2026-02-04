import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/common_state/screen_state.dart';
import 'package:onboarding_winter_project/core/common_use_cases/is_logged_in_use_case.dart';
import 'package:onboarding_winter_project/features/onboarding/domain/use_cases/set_visited_before_use_case.dart';

class OnboardingCubit extends Cubit<ScreenState> {
  OnboardingCubit(this._setVisitedBeforeUseCase, this._isLoggedInUseCase)
    : super(ScreenState.onboarding);
  final SetVisitedBeforeUseCase _setVisitedBeforeUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;

  void setVisitedBefore(bool isVisited) {
    _setVisitedBeforeUseCase.call(isVisited);
  }
}
