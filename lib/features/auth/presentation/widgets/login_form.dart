import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/common_widgets/app_text_field.dart';
import 'package:onboarding_winter_project/core/di/module.dart';
import 'package:onboarding_winter_project/core/resources/app_button_styles.dart';
import 'package:onboarding_winter_project/core/resources/app_images.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/core/router/routes.dart';
import 'package:onboarding_winter_project/core/utils/extensions/context_extension.dart';
import 'package:onboarding_winter_project/core/utils/validation_util.dart';
import 'package:onboarding_winter_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:onboarding_winter_project/features/auth/presentation/auth_cubit/auth_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            validator: (value) => ValidationUtil.validateUsername(value!),
            hint: 'username',
            icon: AppImages.user,
            controller: _usernameController,
          ),
          SizedBox(height: 30),
          AppTextField(
            validator: (value) => ValidationUtil.validatePassword(value!),
            controller: _passwordController,
            hint: 'password',
            icon: AppImages.lock,
            type: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.pinkF8Color12Regular,
            ),
          ),
          SizedBox(height: 50),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ElevatedButton(
                  style: AppButtonStyles.primaryButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                        _usernameController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: AppTextStyles.whiteColor20SemiBold,
                  ),
                );
              }
            },
            listenWhen: (previous, current) =>
                current is AuthSuccessState || current is AuthErrorState,
            listener: (context, state) {
              if (state is AuthSuccessState) {
                context.navigateReplacement(Routes.home);
              } else {
                context.showSnackBar(
                  (state as AuthErrorState).message ?? 'Something went wrong',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
