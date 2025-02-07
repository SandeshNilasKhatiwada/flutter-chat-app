import 'package:chatapp/features/auth/domain/entities/login.dart';

class TestLogin extends Login {
  const TestLogin({required String name, required String password})
      : super(name: name, password: password);
}
