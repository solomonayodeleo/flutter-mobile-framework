import 'package:flutter/material.dart';
import 'package:flutter_mobile_framework/flutter_mobile_ui_library.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await bootstrap();
  runApp(
    const ProviderScope(
      child: FlutterMobileFrameworkApp(),
    ),
  );
}
