import 'package:onboarding_winter_project/features/splash/domain/repositories/splash_repository.dart';

class IsVisitedBeforeUseCase {
  final SplashRepository _splashRepository;

  IsVisitedBeforeUseCase(this._splashRepository);

  bool call() => _splashRepository.isVisitedBefore();
}
