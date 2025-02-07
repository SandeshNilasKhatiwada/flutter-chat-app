import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/api_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/domain/usecases/register_user.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'view/home_page.dart';

void main() {
  final dio = Dio();

  final apiService = ApiService(dio);

  final authRepository = AuthRepositoryImpl(apiService);
  final registerUser = RegisterUser(authRepository);
  final loginUser = LoginUser(authRepository);
  return runApp(BlocProvider(
      create: (_) => AuthBloc(registerUser, loginUser), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', // Set initial screen to Register
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
