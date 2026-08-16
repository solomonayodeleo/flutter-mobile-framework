import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_framework/src/app/splash_screen.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_screen.dart';
import 'package:flutter_mobile_framework/src/features/home/presentation/home_screen.dart';
import 'package:flutter_mobile_framework/src/features/settings/presentation/settings_screen.dart';
import 'package:flutter_mobile_framework/src/features/showcase/presentation/showcase_screen.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/showcase',
        builder: (context, state) => const ShowcaseScreen(),
      ),
    ],
  );
}
