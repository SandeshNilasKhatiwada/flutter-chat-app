import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String email,
    required String password,
    String? image,
  }) : super(name: name, email: email, password: password, image: image);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "image": image,
    };
  }
}
