import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/features/auth/data/api/api_service.dart';
import 'package:fitness_app/features/auth/data/api/end_point.dart';
import 'package:fitness_app/features/auth/data/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ApiService apiService = ApiService();
  RegisterCubit() : super(RegisterInitial());
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firetNameController = TextEditingController();
  TextEditingController lastNAmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());
      final response = await apiService.post(
        body: {
          ApiKey.name: firetNameController.text + lastNAmeController.text,
          ApiKey.email: emailController.text,
          ApiKey.phone: '01153348583',
          ApiKey.password: passwordController.text,
          ApiKey.confirmPassword: passwordController.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        },
        url: EndPoint.signUp,
        isFromData: true,
      );
      final signUpModel = SignUpModel.fromJson(response.data);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }
}
