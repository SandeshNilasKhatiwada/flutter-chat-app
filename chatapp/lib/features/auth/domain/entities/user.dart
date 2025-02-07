import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final File? image;

  const User({
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "name": name,
      "email": email,
      "password": password,
      "image": image != null
          ? await MultipartFile.fromFile(image!.path, filename: "profile.jpg")
          : null,
    };
  }

  @override
  List<Object?> get props => [name, email, password, image];
}
