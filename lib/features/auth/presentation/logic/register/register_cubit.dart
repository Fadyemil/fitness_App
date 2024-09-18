// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firetNameController = TextEditingController();
  TextEditingController lastNAmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthRepo userRepo = AuthRepo();

  Future<void> signUp() async {
    emit(SignUpLoading());
    final response = await userRepo.signUPRepo(
      email: emailController.text,
      password: passwordController.text,
      name: firetNameController.text + lastNAmeController.text,
    );
    response.fold(
      (errMessage) {
        return SignUpFailure(errMessage: errMessage);
      },
      (signUpModel) {
        return emit(SignUpSuccess(message: signUpModel.message));
      },
    );
  }
}
