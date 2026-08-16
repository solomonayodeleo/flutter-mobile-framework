import 'package:flutter/material.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';

class AppLoadingButton extends StatelessWidget {
  const AppLoadingButton({
    super.key,
    required this.label,
    required this.isLoading,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final bool isLoading;
  final VoidCallback onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label),
    );
  }
}
