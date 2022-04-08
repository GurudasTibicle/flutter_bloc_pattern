import 'package:api_demo/products/app_constants.dart';
import 'package:dio/dio.dart';

class RestClient {
  late Dio _dio;

  RestClient._internal() {
    _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
        )
    );
  }

  static final RestClient _instance = RestClient._internal();

  factory RestClient() {
    return _instance;
  }

  Dio getDio() {
    return _dio;
  }
}