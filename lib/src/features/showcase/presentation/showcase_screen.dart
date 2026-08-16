import 'package:flutter/material.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_card.dart';
import 'package:flutter_mobile_framework/src/widgets/app_empty_state.dart';
import 'package:flutter_mobile_framework/src/widgets/app_error_state.dart';
import 'package:flutter_mobile_framework/src/widgets/app_loading_button.dart';
import 'package:flutter_mobile_framework/src/widgets/app_page_header.dart';
import 'package:flutter_mobile_framework/src/widgets/app_section_header.dart';
import 'package:flutter_mobile_framework/src/widgets/app_tag.dart';
import 'package:flutter_mobile_framework/src/widgets/app_text_field.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component showcase')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const AppPageHeader(
            title: 'Reusable UI showcase',
            subtitle: 'A quick internal reference for the shared widget set.',
          ),
          const SizedBox(height: 24),
          const AppSectionHeader(title: 'Buttons'),
          const SizedBox(height: 12),
          _ButtonsRow(),
          const SizedBox(height: 24),
          const AppSectionHeader(title: 'Inputs'),
          const SizedBox(height: 12),
          const AppTextField(labelText: 'Text field', hintText: 'Enter text'),
          const SizedBox(height: 12),
          const AppTextField(
            labelText: 'Password',
            hintText: 'Enter password',
            obscureText: true,
            suffixIcon: Icon(Icons.visibility_off),
          ),
          const SizedBox(height: 24),
          const AppSectionHeader(title: 'States'),
          const SizedBox(height: 12),
          const AppCard(
            child: AppEmptyState(
              title: 'No items yet',
              message: 'Empty states are reusable across lists and dashboards.',
            ),
          ),
          const SizedBox(height: 12),
          const AppCard(
            child: AppErrorState(message: 'Something went wrong'),
          ),
          const SizedBox(height: 24),
          const AppSectionHeader(title: 'Tags'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const AppTag(label: 'Design system'),
              const AppTag(label: 'Reusable'),
              const AppTag(label: 'Starter'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  const _ButtonsRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        AppButton(label: 'Primary', onPressed: () {}),
        AppButton(
          label: 'Secondary',
          variant: AppButtonVariant.secondary,
          onPressed: () {},
        ),
        AppButton(
          label: 'Outlined',
          variant: AppButtonVariant.outlined,
          onPressed: () {},
        ),
        AppLoadingButton(label: 'Loading', isLoading: true, onPressed: () {}),
      ],
    );
  }
}
