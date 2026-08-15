import 'package:flutter/material.dart';
import 'package:flutter_mobile_ui_library/flutter_mobile_ui_library.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('UI Library Example')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Starter Title', style: AppTextStyles.headline),
              const SizedBox(height: 16),
              const AppCard(
                child: Text('Reusable card from the shared library.'),
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Primary Action',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

