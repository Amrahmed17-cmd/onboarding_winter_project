import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';

class SetLoggedInUseCase {
  final AuthRepository _authRepository;
  SetLoggedInUseCase(this._authRepository);

  void call(bool isLoggedIn) {
    _authRepository.setLoggedIn(isLoggedIn);
  }
}
