import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_framework/src/features/auth/presentation/auth_controller.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_card.dart';
import 'package:flutter_mobile_framework/src/widgets/app_empty_state.dart';
import 'package:flutter_mobile_framework/src/widgets/app_error_state.dart';
import 'package:flutter_mobile_framework/src/widgets/app_loading_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_page_header.dart';
import 'package:flutter_mobile_framework/src/widgets/app_text_field.dart';
import 'package:flutter_mobile_framework/src/theme/app_text_styles.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const AppPageHeader(
            title: 'Starter home',
            subtitle:
                'Framework + UI library foundation with reusable components.',
          ),
          const SizedBox(height: 16),
          const AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Framework sample flow'),
                SizedBox(height: 8),
                Text(
                  'Use this screen as the first concrete example for new app screens.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const AppTextField(
            labelText: 'Starter input',
            hintText: 'Type anything here',
          ),
          const SizedBox(height: 16),
          AppLoadingButton(
            label: 'Loading action',
            isLoading: false,
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          const AppEmptyState(
            title: 'Nothing here yet',
            message: 'This is a reusable empty state for future screens.',
          ),
          const SizedBox(height: 16),
          const AppErrorState(
            message: 'This is a reusable error state.',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Open settings',
                  onPressed: () => context.go('/settings'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  label: 'Back to auth',
                  onPressed: () {
                    ref.read(authControllerProvider.notifier).signOut();
                    context.go('/auth');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
