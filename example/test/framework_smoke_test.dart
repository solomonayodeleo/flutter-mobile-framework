import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_mobile_framework/flutter_mobile_ui_library.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_screen.dart';
import 'package:flutter_mobile_framework/src/features/home/presentation/home_screen.dart';
import 'package:flutter_mobile_framework/src/features/settings/presentation/settings_screen.dart';

void main() {
  testWidgets('auth screen renders the starter flow',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: AuthScreen()),
      ),
    );

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Sign in sample user'), findsOneWidget);
  });

  testWidgets('auth to home to settings flow works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: FlutterMobileFrameworkApp(),
      ),
    );

    expect(find.byType(AuthScreen), findsOneWidget);

    await tester.tap(find.text('Sign in sample user'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Open settings'), findsOneWidget);

    await tester.tap(find.text('Open settings'));
    await tester.pumpAndSettle();

    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('logout returns to auth and allows a second sign in',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: FlutterMobileFrameworkApp(),
      ),
    );

    await tester.tap(find.text('Sign in sample user'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));

    await tester.tap(find.text('Open settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    expect(find.byType(AuthScreen), findsOneWidget);

    await tester.tap(find.text('Sign in sample user'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  test('logout resets auth state', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(authControllerProvider.notifier);
    notifier.signOut();

    expect(container.read(authControllerProvider).userName, isNull);
  });
}
