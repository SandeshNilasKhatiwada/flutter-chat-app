import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> registerUser(User user) async {
    final userModel = UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
      image: user.image,
    );
    return await remoteDataSource.registerUser(userModel);
  }
}
