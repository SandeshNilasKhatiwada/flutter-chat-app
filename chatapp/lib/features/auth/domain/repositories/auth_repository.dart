import '../entities/user.dart';

abstract class AuthRepository {
  Future<String> registerUser(User user);
}
