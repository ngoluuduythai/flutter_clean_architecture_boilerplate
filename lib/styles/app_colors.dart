import 'package:flutter/material.dart';

class AppColors {
  static const Color primary1 = Color(0xff333a45);
  static const Color primary2 = Color(0xff7AAEFF);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static Color white20 = const Color(0xffffffff).withOpacity(0.2);
  static Color white8 = const Color(0xffffffff).withOpacity(0.08);
  static Color white6 = const Color(0xffffffff).withOpacity(0.06);
  static Color white12 = Colors.white.withOpacity(0.12);
  static Color white4 = const Color(0xffffffff).withOpacity(0.04);
  static Color white50 = const Color(0xffffffff).withOpacity(0.5);
  static Color white80 = const Color(0xffffffff).withOpacity(0.8);
  static const Color cameraBackground = Color(0xfff0f0f0);
  static const Color black30 = Color(0xff242930);
  static const Color error = Color(0xffe85c4a);
  static const Color redCaution = Color(0xFFF46262);
  static const Color transparent = Color(0x00000000);
  static const Color secondary1 = Color(0xff3b424c);
  static const Color secondary2 = Color(0xff1c1e2a);
  static const Color secondary3 = Color(0xff21232e);
  static const Color secondary4 = Color(0xff2b2c37);
  static const Color secondary5 = Color(0xff7a7b82);
  static const Color secondary6 = Color(0xffa6a7ab);
  static const Color secondary7 = Color(0xff3f414c);
  static const Color secondary8 = Color(0xff1e1f30);
  static const Color loginCard = Color(0xff3d444e);
  static const Color greyOut = Color(0xffE5E5E5);
  static const Color noFrameTitle = Color(0xfff2740a);

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
