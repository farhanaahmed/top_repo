import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final _dio = Dio()..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    compact: false,
  ));
  Future<dynamic> get({required String path, Map<String, dynamic>? queryParams}) {
    return _dio.get(
      path,
      queryParameters: queryParams,
    );
  }
}
