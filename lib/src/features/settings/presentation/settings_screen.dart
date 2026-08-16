import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_card.dart';
import 'package:flutter_mobile_framework/src/theme/app_text_styles.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('App settings', style: AppTextStyles.headline),
              const SizedBox(height: 8),
              const Text(
                'This is a starter placeholder for theme toggles, profile options, or build flags.',
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Log out',
                onPressed: () {
                  ref.read(authControllerProvider.notifier).signOut();
                  context.go('/auth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
