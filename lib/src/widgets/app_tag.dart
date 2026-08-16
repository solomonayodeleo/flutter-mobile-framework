import 'package:flutter/material.dart';

class AppTag extends StatelessWidget {
  const AppTag({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}
