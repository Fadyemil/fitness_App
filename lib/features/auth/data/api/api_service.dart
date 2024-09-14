// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/features/auth/data/api/api_interceptors.dart';
import 'package:fitness_app/features/auth/data/api/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio}) : _dio = dio ?? Dio() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio
      ..options.baseUrl = EndPoint.baseUrl
      ..interceptors.addAll([
        ApiInterceptors(),
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      ]);
  }

  Map<String, String> _buildHeaders(
      String? token, Map<String, String>? additionalHeaders) {
    final baseHeaders = {'Authorization': 'Bearer $token'};
    return additionalHeaders != null
        ? {...baseHeaders, ...additionalHeaders}
        : baseHeaders;
  }

  Future post({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    String? contentType,
    bool isFromData = false,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: isFromData ? FormData.fromMap(body) : body,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: _buildHeaders(token, headers),
        ),
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
