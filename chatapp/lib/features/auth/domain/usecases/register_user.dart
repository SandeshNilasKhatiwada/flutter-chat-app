import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Either<String, String>> call(User user) async {
    return await repository.registerUser(user);
  }
}
