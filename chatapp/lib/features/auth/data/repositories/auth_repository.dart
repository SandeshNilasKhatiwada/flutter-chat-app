import 'package:chatapp/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<String> registerUser(User user);
}
