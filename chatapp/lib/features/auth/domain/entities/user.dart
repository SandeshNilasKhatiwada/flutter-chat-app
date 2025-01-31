import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? image;

  const User({
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [name, email, password, image];
}
