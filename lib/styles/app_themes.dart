import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_colors.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';

class AppBorderRadius {
  static const double sm = 5;
  static const double md = 10;
  static const double lg = 15;
  static const double xl = 20;
  static const double xxl = 25;
}

class AppThemes {
  static ThemeData getTheme({bool isDark = true}) {
    return ThemeData(
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: AppColors.black,
      dividerColor: AppColors.border,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.black,
        onSurface: AppColors.onBlack,
        shadow: AppColors.black,
      ),
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primary,
        labelTextStyle:
            WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          TextStyle style =
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 11);
          if (states.contains(WidgetState.selected)) {
            style = style.merge(const TextStyle(
                fontWeight: FontWeight.w600, color: AppColors.primary));
          }
          return style;
        }),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        indicatorColor: AppColors.primary,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fixedSize: const Size.fromHeight(50),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          fillColor: AppColors.black,
        ),
        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.black),
          elevation: const WidgetStatePropertyAll<double>(0),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.border),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        fillColor: AppColors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
      ),
    );
  }

  static ThemeData get darkTheme => getTheme();
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
