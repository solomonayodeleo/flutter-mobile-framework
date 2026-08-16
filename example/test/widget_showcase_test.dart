import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_framework/flutter_mobile_ui_library.dart';

void main() {
  testWidgets('shared widgets render basic states', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              AppButton(label: 'Primary', onPressed: () {}),
              AppButton(
                label: 'Outlined',
                variant: AppButtonVariant.outlined,
                onPressed: () {},
              ),
              const AppLoadingButton(
                label: 'Loading',
                isLoading: false,
                onPressed: _noop,
              ),
              const AppTextField(labelText: 'Name'),
              const AppPageHeader(title: 'Header'),
              const AppSectionHeader(title: 'Section'),
              const AppTag(label: 'Tag'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Primary'), findsOneWidget);
    expect(find.text('Outlined'), findsOneWidget);
    expect(find.text('Loading'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Section'), findsOneWidget);
    expect(find.text('Tag'), findsOneWidget);
  });
}

void _noop() {}
