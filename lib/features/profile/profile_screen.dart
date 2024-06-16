import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('ProfileScreen', style: AppTextStyles.h1),
          ],
        ),
      ),
    );
  }
}
