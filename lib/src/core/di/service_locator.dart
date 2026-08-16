import 'package:get_it/get_it.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/in_memory_auth_repository.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  if (!getIt.isRegistered<AuthRepository>()) {
    getIt.registerLazySingleton<AuthRepository>(() => InMemoryAuthRepository());
  }
}

