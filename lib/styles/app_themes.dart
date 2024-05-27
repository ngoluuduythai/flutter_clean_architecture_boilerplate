import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_colors.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      canvasColor: AppColors.transparent,
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary1),
      scaffoldBackgroundColor: AppColors.primary1,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextThemes.darkTextTheme.titleLarge,
        actionsIconTheme: const IconThemeData(
          color: AppColors.primary2,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.primary2, //change your color here
        ),
        elevation: 0,
        backgroundColor: AppColors.primary1,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: AppTextStyles.bodyLg,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.black.withOpacity(0.82),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.primary1,
        useIndicator: true,
        indicatorColor: AppColors.transparent,
        labelType: NavigationRailLabelType.all,
        selectedLabelTextStyle:
            AppTextStyles.subtitleSm.copyWith(color: AppColors.primary2),
        unselectedLabelTextStyle:
            AppTextStyles.subtitleSm.copyWith(color: AppColors.white),
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary2,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary1,
        selectedItemColor: AppColors.primary2,
        unselectedItemColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          backgroundColor: AppColors.primary2,
          foregroundColor: AppColors.black,
          disabledBackgroundColor: AppColors.primary2,
          disabledForegroundColor: AppColors.black,
          textStyle: AppTextStyles.h4,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          backgroundColor: AppColors.primary2,
          textStyle: AppTextStyles.h4,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: AppTextStyles.subtitle.copyWith(color: AppColors.error),
        filled: true,
        fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return states.contains(WidgetState.focused)
              ? AppColors.white8
              : AppColors.secondary1;
        }),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white6, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white6, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary2, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        floatingLabelStyle:
            WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.focused)
              ? AppColors.primary2
              : AppColors.white50;
          return TextStyle(color: color);
        }),
        labelStyle: AppTextStyles.subtitleLg.copyWith(color: AppColors.white50),
        suffixIconColor: AppColors.primary2,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primary2,
      ),
      disabledColor: AppColors.white20,
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedIconColor: AppColors.white,
        iconColor: AppColors.white,
        textColor: AppColors.white,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: AppTextStyles.h2.copyWith(color: AppColors.white),
        contentTextStyle:
            AppTextStyles.subtitleLg.copyWith(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: AppColors.secondary1,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: const CircleBorder(),
        checkColor: WidgetStateProperty.all(AppColors.black),
        fillColor: WidgetStateProperty.all(
          AppColors.primary2,
        ),
        side: BorderSide(color: AppColors.white20, width: 1.0),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary1,
        secondary: AppColors.primary2,
        surface: AppColors.primary1,
      ).copyWith(surface: AppColors.black),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      canvasColor: AppColors.transparent,
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary1),
      scaffoldBackgroundColor: AppColors.primary1,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextThemes.darkTextTheme.titleLarge,
        actionsIconTheme: const IconThemeData(
          color: AppColors.primary2,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.primary2, //change your color here
        ),
        elevation: 0,
        backgroundColor: AppColors.primary1,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.primary1,
        useIndicator: true,
        indicatorColor: AppColors.transparent,
        labelType: NavigationRailLabelType.all,
        selectedLabelTextStyle:
            AppTextStyles.subtitleSm.copyWith(color: AppColors.primary2),
        unselectedLabelTextStyle:
            AppTextStyles.subtitleSm.copyWith(color: AppColors.white),
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary2,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: AppTextStyles.bodyLg,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.black.withOpacity(0.82),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary1,
        selectedItemColor: AppColors.primary2,
        unselectedItemColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          backgroundColor: AppColors.primary2,
          foregroundColor: AppColors.black,
          disabledBackgroundColor: AppColors.primary2,
          disabledForegroundColor: AppColors.black,
          textStyle: AppTextStyles.h4,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          backgroundColor: AppColors.primary2,
          textStyle: AppTextStyles.h4,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: AppTextStyles.subtitle.copyWith(color: AppColors.error),
        filled: true,
        fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return states.contains(WidgetState.focused)
              ? AppColors.white8
              : AppColors.secondary1;
        }),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white6, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white6, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary2, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        floatingLabelStyle:
            WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.focused)
              ? AppColors.primary2
              : AppColors.white50;
          return TextStyle(color: color);
        }),
        labelStyle: AppTextStyles.subtitleLg.copyWith(color: AppColors.white50),
        suffixIconColor: AppColors.primary2,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primary2,
      ),
      disabledColor: AppColors.white20,
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedIconColor: AppColors.white,
        iconColor: AppColors.white,
        textColor: AppColors.white,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: AppTextStyles.h2.copyWith(color: AppColors.white),
        contentTextStyle:
            AppTextStyles.subtitleLg.copyWith(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: AppColors.secondary1,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: const CircleBorder(),
        checkColor: WidgetStateProperty.all(AppColors.black),
        fillColor: WidgetStateProperty.all(
          AppColors.primary2,
        ),
        side: BorderSide(color: AppColors.white20, width: 1.0),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary1,
        secondary: AppColors.primary2,
        surface: AppColors.primary1,
      ).copyWith(surface: AppColors.black),
    );
  }
}

class TextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.body,
      titleLarge: AppTextStyles.subtitleLg,
      titleMedium: AppTextStyles.subtitle,
      titleSmall: AppTextStyles.subtitleSm,
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
      headlineSmall: AppTextStyles.h5,
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.white),
      titleLarge: AppTextStyles.subtitleLg.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.subtitle.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.subtitleSm.copyWith(color: AppColors.white),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.white),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.white),
      headlineSmall: AppTextStyles.h5.copyWith(color: AppColors.white),
    );
  }

  static TextTheme get lightTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.black),
      titleLarge: AppTextStyles.subtitleLg.copyWith(color: AppColors.black),
      titleMedium: AppTextStyles.subtitle.copyWith(color: AppColors.black),
      titleSmall: AppTextStyles.subtitleSm.copyWith(color: AppColors.black),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.black),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.black),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.black),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.black),
      headlineSmall: AppTextStyles.h5.copyWith(color: AppColors.black),
    );
  }

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.white),
      titleLarge: AppTextStyles.subtitleLg.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.subtitle.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.subtitleSm.copyWith(color: AppColors.white),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.white),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.white),
      headlineSmall: AppTextStyles.h5.copyWith(color: AppColors.white),
    );
  }
}
