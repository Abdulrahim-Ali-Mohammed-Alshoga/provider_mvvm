import 'package:dio/dio.dart';
import 'package:moives_api/core/resources/conction.dart';

class DioFactory {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: Connection.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 10 * 1000,
      connectTimeout: 10 * 1000));

  Dio get dio => _dio;
}
