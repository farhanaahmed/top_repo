import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();

  Future<dynamic> get(String path) {
    return _dio.get(path);
  }
}
