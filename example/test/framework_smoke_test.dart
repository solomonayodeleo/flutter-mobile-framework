import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_mobile_framework/flutter_mobile_ui_library.dart';
import 'package:flutter_mobile_framework/src/core/di/service_locator.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_screen.dart';
import 'package:flutter_mobile_framework/src/features/home/presentation/home_screen.dart';
import 'package:flutter_mobile_framework/src/features/settings/presentation/settings_screen.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String> signIn() async => 'Sample User';
}

void main() {
  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    if (getIt.isRegistered<AuthRepository>()) {
      await getIt.reset();
    }
    getIt.registerSingleton<AuthRepository>(FakeAuthRepository());
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('splash to auth to home to settings to logout flow',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: FlutterMobileFrameworkApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(AuthScreen), findsOneWidget);

    await tester.tap(find.text('Sign in sample user'));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.text('Open settings'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);

    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    expect(find.byType(AuthScreen), findsOneWidget);

    await tester.tap(find.text('Sign in sample user'));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
