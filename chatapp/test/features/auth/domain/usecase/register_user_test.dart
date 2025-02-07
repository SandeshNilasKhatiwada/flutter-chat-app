import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:chatapp/features/auth/domain/usecases/register_user.dart';

import '../entities/test_user.dart'; // ✅ Import TestUser
import 'register_user_test.mocks.dart'; // ✅ Import generated mock file

// Generate mock class for AuthRepository
@GenerateMocks([AuthRepository])
void main() {
  late RegisterUser registerUser;
  late MockAuthRepository mockAuthRepository;

  // 🔥 FIX: Provide Dummy Value for Either<String, String>
  setUpAll(() {
    provideDummy<Either<String, String>>(const Right('dummy_value'));
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUser = RegisterUser(mockAuthRepository);
  });

  final userWithImage = TestUser(
    name: 'testuser',
    email: 'test@example.com',
    password: 'password123',
    image: File('path/to/dummy_image.jpg'),
  );

  final userWithoutImage = TestUser(
    name: 'testuser',
    email: 'test@example.com',
    password: 'password123',
  );

  // ✅ 1. Successful Registration
  test('should return success message when registration is successful',
      () async {
    when(mockAuthRepository.registerUser(any))
        .thenAnswer((_) async => const Right('Registration successful'));

    final result = await registerUser.call(userWithoutImage);

    expect(result, equals(const Right('Registration successful')));
    verify(mockAuthRepository.registerUser(userWithoutImage)).called(1);
  });

  // ❌ 2. Failed Registration Returns an Error
  test('should return failure message when registration fails', () async {
    when(mockAuthRepository.registerUser(any))
        .thenAnswer((_) async => const Left('Registration failed'));

    final result = await registerUser.call(userWithoutImage);

    expect(result, equals(const Left('Registration failed')));
    verify(mockAuthRepository.registerUser(userWithoutImage)).called(1);
  });

  // 📸 3. Successful Registration With Image
  test(
      'should return success message when registration with image is successful',
      () async {
    when(mockAuthRepository.registerUser(any))
        .thenAnswer((_) async => const Right('Registration successful'));

    final result = await registerUser.call(userWithImage);

    expect(result, equals(const Right('Registration successful')));
    verify(mockAuthRepository.registerUser(userWithImage)).called(1);
  });

  // ⚠️ 4. Registration with Empty Fields Returns Validation Error
  test('should return validation error when fields are empty', () async {
    const emptyUser = TestUser(name: '', email: '', password: '');

    when(mockAuthRepository.registerUser(any))
        .thenAnswer((_) async => const Left('Fields cannot be empty'));

    final result = await registerUser.call(emptyUser);

    expect(result, equals(const Left('Fields cannot be empty')));
    verify(mockAuthRepository.registerUser(emptyUser)).called(1);
  });

  // 🚨 5. Repository Throws an Exception
  test('should return failure when repository throws an exception', () async {
    when(mockAuthRepository.registerUser(any))
        .thenThrow(Exception('Something went wrong'));

    final result = await registerUser.call(userWithoutImage);

    expect(result.isLeft(), isTrue);
    verify(mockAuthRepository.registerUser(userWithoutImage)).called(1);
  });
}
