import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ScanScreen', style: AppTextStyles.h1),
          ],
        ),
      ),
    );
  }
}
