import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_framework/src/core/di/service_locator.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String> signIn() async => 'Sample User';
}

void main() {
  setUp(() async {
    if (getIt.isRegistered<AuthRepository>()) {
      await getIt.reset();
    }
    getIt.registerSingleton<AuthRepository>(FakeAuthRepository());
  });

  tearDown(() async {
    await getIt.reset();
  });

  test('sign in updates auth state', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container.read(authControllerProvider.notifier).signIn();

    final state = container.read(authControllerProvider);
    expect(state.isAuthenticated, isTrue);
    expect(state.userName, 'Sample User');
  });

  test('sign out resets auth state', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(authControllerProvider.notifier);
    await notifier.signIn();
    notifier.signOut();

    final state = container.read(authControllerProvider);
    expect(state.isAuthenticated, isFalse);
    expect(state.userName, isNull);
  });
}
