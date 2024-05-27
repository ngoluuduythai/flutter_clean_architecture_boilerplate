import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/localization/string_hardcoded.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/app_router.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'My App'.hardcoded,
      supportedLocales: const [
        // 'en' is the language code. We could optionally provide a
        // a country code as the second param, e.g.
        // Locale('en', 'US'). If we do that, we may want to
        // provide an additional app_en_US.arb file for
        // region-specific translations.
        Locale('en', ''),
        // Locale('vi', ''),
      ],
      themeMode: ThemeMode.dark,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
