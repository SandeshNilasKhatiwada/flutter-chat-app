import 'package:hive/hive.dart';

part 'user.g.dart'; // Required for Hive code generation

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String dob;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String phone;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.gender,
    required this.phone,
  });
}
