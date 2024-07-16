import 'package:flutter/material.dart';

class ErrorUi extends StatelessWidget {
  const ErrorUi({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Connection Error'),
    );
  }
}
