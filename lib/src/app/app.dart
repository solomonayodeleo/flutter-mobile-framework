import 'package:flutter/material.dart';
import 'package:flutter_mobile_framework/src/app/router.dart';
import 'package:flutter_mobile_framework/src/app/theme.dart';

class FlutterMobileFrameworkApp extends StatelessWidget {
  const FlutterMobileFrameworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}

