// Flutter imports:
// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

abstract class ColorThemes {
  static const Color darkGreen = Color(0xFF0E693E);
  static const Color courtGreen = Color(0xFF2BB673);
  static const Color pickleGreen = Color(0xFF64D245);
  static const Color hotPurple = Color(0xFF380E69);
  static const Color primary = Color(0xFF2E213D);
  static const Color secondary = Color(0xFF8F869A);
  static const Color orange = Color(0xFFFFA800);
  static const Color lightGrey = Color(0xFFE6E2EA);
  static const Color alert = Color(0xFFFF015C);
}

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'amount has to be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'amount has to be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  bool get isDark {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness < .5;
  }
}
