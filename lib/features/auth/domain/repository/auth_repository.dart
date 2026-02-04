import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login(LoginRequestModel request);
  void setLoggedIn(bool isLoggedIn);
  void saveUserData(LoginEntity loginEntity);
  // Future<ApiResult<SignUpResponse>> register(String username, String password);
  // Future<ApiResult<void>> logout();
  // Future<ApiResult<void>> forgetPassword(String email);
}
