import 'package:chatapp/features/auth/domain/entities/login.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);
  @override
  Future<Either<String, String>> registerUser(User user) async {
    final data = await user.toJson();
    final result = await apiService.post('/user/register', data);

    if (result.statusCode == 201) return Right(result.data['token']);

    return const Left('Failed to create account');
  }

  @override
  Future<Either<String, String>> loginUser(Login login) async {
    final result = await apiService.post("/user/login", login.toJson());
    if (result.statusCode == 200) return Right(result.data['token']);
    return const Left('Failed to login');
  }
}
