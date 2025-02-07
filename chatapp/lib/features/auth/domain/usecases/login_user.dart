import 'package:chatapp/features/auth/domain/entities/login.dart';
import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);
  Future<Either<String, String>> call(Login login) async {
    return await repository.loginUser(login);
  }
}
