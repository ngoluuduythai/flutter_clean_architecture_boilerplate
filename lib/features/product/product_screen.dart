import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ProductScreen', style: AppTextStyles.h1),
          ],
        ),
      ),
    );
  }
}
