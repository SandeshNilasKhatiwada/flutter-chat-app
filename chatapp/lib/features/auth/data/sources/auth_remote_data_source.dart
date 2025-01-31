import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<String> registerUser(UserModel user) async {
    try {
      final response = await dio.post(
        "http:localhost:5000/user/register",
        data: user.toJson(),
      );

      if (response.statusCode == 201) {
        return response.data["token"];
      } else {
        throw Exception("API returned an error: ${response.data}");
      }
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }
}
