// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import '../../features/auth/data/sources/auth_remote_data_source.dart';
// import '../../features/auth/data/repositories/auth_repository_impl.dart';
// import '../../features/auth/domain/repositories/auth_repository.dart';
// import '../../features/auth/presentation/viewmodels/auth_viewmodel.dart';

// final sl = GetIt.instance;

// void setupDependencies() {
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => AuthRemoteDataSource(sl<Dio>()));
//   sl.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));
//   sl.registerFactory(() => AuthViewModel(sl<AuthRepository>()));
// }
