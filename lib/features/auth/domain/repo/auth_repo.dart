import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:fitness_app/core/cache/cach_helper.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/features/auth/data/api/api_service.dart';
import 'package:fitness_app/features/auth/data/api/end_point.dart';
// import 'package:fitness_app/features/auth/data/models/sign_in_model.dart';
import 'package:fitness_app/features/auth/data/models/sign_up_model.dart';
import 'package:fitness_app/features/auth/domain/entites/body_response_login.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

abstract class AuthRepo {
  final ApiService apiService = ApiService();

  Future<Either<String, BodyResponseLogin>> signInRepo();

  Future<Either<String, SignUpModel>> signUPRepo(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response = await apiService.post(
        body: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: '01153348583',
          ApiKey.password: password,
          ApiKey.confirmPassword: password,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        },
        url: EndPoint.signUp,
        isFromData: true,
      );
      final signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
