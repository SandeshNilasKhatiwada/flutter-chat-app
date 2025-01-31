import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Register Event with Image Upload Support
class RegisterUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final File? image;

  RegisterUserEvent({
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [name, email, password, image];
}

// Login Event
class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
