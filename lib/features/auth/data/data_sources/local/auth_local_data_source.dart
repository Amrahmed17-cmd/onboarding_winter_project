import 'package:onboarding_winter_project/core/storage/secure_storage.dart';
import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/user_data_entity.dart';

class AuthLocalDataSource {
  final SharedPrefsHelper _sharedPrefsHelper;
  final SecureStorage _secureStorage;

  AuthLocalDataSource(this._sharedPrefsHelper, this._secureStorage);

  void setLoggedIn(bool isLoggedIn) {
    _sharedPrefsHelper.setLoggedIn(isLoggedIn);
  }

  void saveUserData(LoginEntity loginEntity) {
    _secureStorage.saveToken(loginEntity.accessToken!);
    _sharedPrefsHelper.saveUserData(
      UserDataEntity.fromLoginEntity(loginEntity),
    );
  }
}
