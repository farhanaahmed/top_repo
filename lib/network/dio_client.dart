import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();
  Future<dynamic> get({required String path, Map<String, dynamic>? queryParams}) {
    return _dio.get(
      path,
      queryParameters: queryParams,
    );
  }
}
