import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio dio = Dio(); // Create Dio instance

  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<LoginUserEvent>(_onLoginUser);
  }

  // Handle User Registration
  Future<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Prepare multipart form data for image upload
      FormData formData = FormData.fromMap({
        "name": event.name,
        "email": event.email,
        "password": event.password,
        "image": event.image != null
            ? await MultipartFile.fromFile(event.image!.path,
                filename: "profile.jpg")
            : null,
      });

      // Send request to the backend
      Response response = await dio.post(
        "http://localhost:5000/user/register", // Use 10.0.2.2 for Android Emulator
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      if (response.statusCode == 201) {
        emit(AuthSuccess(
            "Registration Successful! Token: ${response.data['token']}"));
      } else {
        emit(AuthFailure("Registration failed: ${response.data}"));
      }
    } catch (e) {
      emit(AuthFailure("Failed to connect to the server: $e"));
    }
  }

  // Handle User Login
  Future<void> _onLoginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Send request to the backend
      Response response = await dio.post(
        "http://localhost:5000/user/login",
        data: {"name": event.email, "password": event.password},
      );

      if (response.statusCode == 200) {
        emit(AuthSuccess("Login Successful! Token: ${response.data['token']}"));
      } else {
        emit(AuthFailure("Login failed: ${response.data}"));
      }
    } catch (e) {
      emit(AuthFailure("Failed to connect to the server: $e"));
    }
  }
}
