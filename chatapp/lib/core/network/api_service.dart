import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = "http://localhost:5000";
    dio.options.headers = {'Content-Type': 'application/json'};

    // Add Logging Interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("📤 [REQUEST] ${options.method} ${options.uri}");
        print("📄 Data: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("🟢 [RESPONSE] ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          return handler.resolve(e.response!);
        }
        print("🔴 [ERROR] ${e.response?.statusCode} ${e.response?.data}");
        return handler.next(e);
      },
    ));
  }

  Future<Response> post(String endpoint, dynamic data) async {
    return await dio.post(endpoint, data: data);
  }
}
