import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/cache/cach_helper.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/features/auth/data/api/api_service.dart';
import 'package:fitness_app/features/auth/data/api/end_point.dart';
import 'package:fitness_app/features/auth/data/models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiService apiService = ApiService();
  LoginCubit() : super(LoginInitial());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInModel? user;
  Future<void> signIn() async {
    try {
      emit(SignInLoading());
      final response = await apiService.post(
        url: EndPoint.signIn,
        body: {
          ApiKey.email: emailController.text,
          ApiKey.password: passwordController.text,
        },
      );
      emit(SignInSuccess());
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user?.token ?? '');
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }
}
