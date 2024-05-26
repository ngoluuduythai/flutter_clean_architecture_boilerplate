import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/common_widgets/empty_placeholder_widget.dart';
import 'package:flutter_clean_architecture_boilerplate/localization/string_hardcoded.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}
