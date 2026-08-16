import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_card.dart';
import 'package:flutter_mobile_framework/src/theme/app_text_styles.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next.isAuthenticated &&
          previous?.status != AuthStatus.signedIn) {
        context.go('/home');
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Framework Starter')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Welcome back', style: AppTextStyles.headline),
                const SizedBox(height: 8),
                const Text(
                  'This sample flow shows Riverpod, GetIt, routing, theming, and reusable UI together.',
                ),
                const SizedBox(height: 24),
                AppButton(
                  label:
                      state.isLoading ? 'Signing in...' : 'Sign in sample user',
                  onPressed: state.isLoading
                      ? () {}
                      : () => ref.read(authControllerProvider.notifier).signIn(),
                ),
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
