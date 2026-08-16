import 'package:flutter/material.dart';
import 'package:flutter_mobile_framework/src/widgets/app_button.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onActionPressed != null) ...[
              const SizedBox(height: 16),
              AppButton(
                label: actionLabel!,
                onPressed: onActionPressed!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
