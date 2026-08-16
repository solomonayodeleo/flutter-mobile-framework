import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, outlined }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = switch (variant) {
      AppButtonVariant.primary => FilledButton.styleFrom(),
      AppButtonVariant.secondary => FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
        ),
      AppButtonVariant.outlined => OutlinedButton.styleFrom(),
    };

    return switch (variant) {
      AppButtonVariant.outlined => OutlinedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Text(label),
        ),
      _ => FilledButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Text(label),
        ),
    };
  }
}
