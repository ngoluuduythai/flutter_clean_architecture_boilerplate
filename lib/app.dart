import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/app_router.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/constants.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // 'en' is the language code. We could optionally provide a
        // a country code as the second param, e.g.
        // Locale('en', 'US'). If we do that, we may want to
        // provide an additional app_en_US.arb file for
        // region-specific translations.
        EN_LOCAL,
        VI_LOCAL,
      ],
      locale: VI_LOCAL,
      themeMode: ThemeMode.dark,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
