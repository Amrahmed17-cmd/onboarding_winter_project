import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_request_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/login_use_case.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/save_user_data_use_case.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/set_logged_in_use_case.dart';
import 'package:onboarding_winter_project/features/auth/presentation/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final SetLoggedInUseCase _setLoggedInUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  AuthCubit(
    this._loginUseCase,
    this._setLoggedInUseCase,
    this._saveUserDataUseCase,
  ) : super(AuthInitialState());

  Future<void> login(String username, String password) async {
    emit(AuthLoadingState());
    ApiResult<LoginEntity> apiResult = await _loginUseCase(
      LoginRequestEntity(username, password),
    );
    if (apiResult is Success<LoginEntity>) {
      _saveUserDataUseCase((apiResult as Success).data);
      setLoggedIn(true);
      emit(AuthSuccessState());
    } else {
      emit(
        AuthErrorState(
          (state as AuthErrorState).message ?? 'Something went wrong',
        ),
      );
    }
  }

  void setLoggedIn(bool isLoggedIn) {
    _setLoggedInUseCase(isLoggedIn);
  }
}
