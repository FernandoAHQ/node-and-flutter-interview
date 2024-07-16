import 'package:flutter/material.dart';
import 'package:frontend/styles.dart';

class LoadingUi extends StatelessWidget {
  const LoadingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Loading...', style: loadingStyle),
    );
  }
}
