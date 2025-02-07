import 'dart:io';
import 'package:chatapp/features/auth/domain/entities/user.dart';

class TestUser extends User {
  const TestUser({
    required String name,
    required String email,
    required String password,
    File? image,
  }) : super(name: name, email: email, password: password, image: image);
}
