import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_framework/src/core/di/service_locator.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
}

