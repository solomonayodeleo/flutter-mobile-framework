import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_framework/src/app/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('theme toggles and persists', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final initial = await container.read(themeControllerProvider.future);
    expect(initial, ThemeMode.system);

    await container.read(themeControllerProvider.notifier).setThemeMode(
          ThemeMode.dark,
        );

    expect(container.read(themeControllerProvider).value, ThemeMode.dark);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('app_theme_mode'), 'dark');
  });
}
