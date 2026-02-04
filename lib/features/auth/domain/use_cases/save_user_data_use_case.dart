import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';

class SaveUserDataUseCase {
  final AuthRepository _authRepository;

  SaveUserDataUseCase(this._authRepository);
  void call(LoginEntity loginEntity) {
    _authRepository.saveUserData(loginEntity);
  }
}
