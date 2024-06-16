import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff1A77FF);
  static const Color secondary = Color(0xffFFBB05);
  static const Color accent = Color(0xffF5C3D2);
  static const Color border = Color(0xff505254);
  static const Color danger = Color(0xffF70000);
  static const Color success = Color(0xff04B616);
  static const Color black = Color(0xff1A1A1A);
  static const Color onBlack = Color(0xff353535);
  static const Color onWhite = Color(0xffEBEBEB);
  static const Color white = Color(0xffF2F2F2);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    // ignore: no_leading_underscores_for_local_identifiers
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }
}
