import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mobile_framework/src/app/router.dart';
import 'package:flutter_mobile_framework/src/app/theme.dart';
import 'package:flutter_mobile_framework/src/app/theme_controller.dart';

class FlutterMobileFrameworkApp extends ConsumerWidget {
  const FlutterMobileFrameworkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = createRouter();
    final themeMode = ref.watch(themeControllerProvider).valueOrNull ??
        ThemeMode.system;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
