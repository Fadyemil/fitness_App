import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/entites/body_response_login.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepo userRepo = AuthRepo();

  Future<void> signIn() async {
    emit(SignInLoading());
    final response = await userRepo.signInRepo(
        bodyResponseLogin: BodyResponseLogin(
      email: emailController.text,
      password: passwordController.text,
    ));
    response.fold(
      (errMessage) {
        return emit(SignInFailure(errMessage: errMessage));
      },
      (signInModel) {
        return emit(SignInSuccess());
      },
    );
  }
}
