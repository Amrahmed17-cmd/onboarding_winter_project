import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';
import 'package:onboarding_winter_project/features/splash/domain/repositories/splash_repository.dart';

class IsLoggedInUseCase {
  final SplashRepository _splashRepository;

  IsLoggedInUseCase(this._splashRepository);

  bool call() => _splashRepository.isLoggedIn();
}
