import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_framework/src/app/theme_controller.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_card.dart';
import 'package:flutter_mobile_framework/src/widgets/app_page_header.dart';

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
              const AppPageHeader(
                title: 'App settings',
                subtitle: 'Manage app appearance and session actions.',
              ),
              const SizedBox(height: 8),
              AppButton(
                label: ref.watch(themeControllerProvider).valueOrNull ==
                        ThemeMode.dark
                    ? 'Switch to light theme'
                    : 'Switch to dark theme',
                variant: AppButtonVariant.outlined,
                onPressed: () {
                  ref.read(themeControllerProvider.notifier).toggleTheme();
                },
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
