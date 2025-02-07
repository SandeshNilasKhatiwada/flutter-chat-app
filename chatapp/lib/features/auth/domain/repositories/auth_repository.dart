import 'package:chatapp/features/auth/domain/entities/login.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<String, String>> registerUser(User user);
  Future<Either<String, String>> loginUser(Login login);
}
