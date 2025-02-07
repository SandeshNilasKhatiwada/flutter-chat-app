import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {super.image,
      required super.name,
      required super.email,
      required super.password});
}
