import 'package:chatapp/features/auth/data/models/login_model.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:chatapp/features/auth/domain/usecases/login_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/register_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser _registerUser;
  final LoginUser _loginUser;

  AuthBloc(this._registerUser, this._loginUser) : super(AuthInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<LoginUserEvent>(_onLoginUser);
  }

  // Handle User Registration
  Future<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    // Send request to the backend
    final user = UserModel(
      name: event.name,
      email: event.email,
      password: event.password,
      image: event.image,
    );
    final response = await _registerUser(user);

    response.fold(
        (message) => emit(AuthFailure("Registration failed: $message")),
        (data) => emit(AuthSuccess("Registration Successful! Token: $data")));
  }

  // // Handle User Login
  Future<void> _onLoginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    // Send request to the backend
    final login = LoginModel(name: event.email, password: event.password);

    final result = await _loginUser(login);

    result.fold((message) => emit(AuthFailure(message)),
        (token) => emit(AuthSuccess("Login Successful! Token: $token")));
  }
}
