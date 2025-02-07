import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:chatapp/features/auth/domain/usecases/login_user.dart';

import '../entities/test_login.dart'; // Import the test subclass
import 'login_user_test.mocks.dart'; // Import generated mock file

// Generate mock class for AuthRepository
@GenerateMocks([AuthRepository])
void main() {
  late LoginUser loginUser;
  late MockAuthRepository mockAuthRepository;

  // 🔥 FIX: Provide Dummy Value for Either<String, String>
  setUpAll(() {
    provideDummy<Either<String, String>>(const Right('dummy_value'));
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUser = LoginUser(mockAuthRepository);
  });

  const login =
      TestLogin(name: 'testuser', password: 'password123'); // ✅ Uses TestLogin

  // ✅ 1. Successful Login Returns a Token
  test('should return user token when login is successful', () async {
    when(mockAuthRepository.loginUser(any))
        .thenAnswer((_) async => const Right('fake_token'));

    final result = await loginUser.call(login);

    expect(result, equals(const Right('fake_token')));
    verify(mockAuthRepository.loginUser(login)).called(1);
  });

  // ❌ 2. Failed Login Returns an Error
  test('should return failure message when login fails', () async {
    when(mockAuthRepository.loginUser(any))
        .thenAnswer((_) async => const Left('Invalid credentials'));

    final result = await loginUser.call(login);

    expect(result, equals(const Left('Invalid credentials')));
    verify(mockAuthRepository.loginUser(login)).called(1);
  });

  // ⚠️ 3. Login with Empty Credentials Returns Validation Error
  test('should return validation error when credentials are empty', () async {
    const emptyLogin = TestLogin(name: '', password: '');

    when(mockAuthRepository.loginUser(any))
        .thenAnswer((_) async => const Left('Fields cannot be empty'));

    final result = await loginUser.call(emptyLogin);

    expect(result, equals(const Left('Fields cannot be empty')));
    verify(mockAuthRepository.loginUser(emptyLogin)).called(1);
  });

  // 🚨 4. Repository Throws an Exception
  test('should return failure when repository throws an exception', () async {
    when(mockAuthRepository.loginUser(any))
        .thenThrow(Exception('Something went wrong'));

    final result = await loginUser.call(login);

    expect(result.isLeft(), isTrue);
    verify(mockAuthRepository.loginUser(login)).called(1);
  });
}
