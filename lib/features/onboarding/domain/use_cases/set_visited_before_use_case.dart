import 'package:onboarding_winter_project/features/onboarding/domain/repositories/onboarding_repository.dart';

class SetVisitedBeforeUseCase {
  final OnboardingRepository _onboardingRepository;

  SetVisitedBeforeUseCase(this._onboardingRepository);

  void call(bool isVisited) {
    _onboardingRepository.setOnboardingVisitBefore(isVisited);
  }
}
