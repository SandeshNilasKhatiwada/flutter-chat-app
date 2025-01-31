import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel(this.authRepository);

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  Future<void> registerUser(User user) async {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();

    try {
      final token = await authRepository.registerUser(user);
      _successMessage = "Registration Successful!";
    } catch (e) {
      _errorMessage = "Registration Failed: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
