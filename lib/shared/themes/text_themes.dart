// Flutter imports:
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

import 'color_themes.dart';

abstract class TextThemes {
  static String get fontFamily => GoogleFonts.outfit().fontFamily ?? '';

  ///color: Dark Green
  static _ITextTheme get darkGreen => _CTextTheme(color: ColorThemes.darkGreen);

  ///color: Pickle Green
  static _ITextTheme get pickleGreen =>
      _CTextTheme(color: ColorThemes.pickleGreen);

  ///color: Hot Purple
  static _ITextTheme get hotPurple => _CTextTheme(color: ColorThemes.hotPurple);

  ///color: Primary
  static _ITextTheme get primary => _CTextTheme(color: ColorThemes.primary);

  ///color: Secondary
  static _ITextTheme get secondary => _CTextTheme(color: ColorThemes.secondary);

  ///color: Light Grey
  static _ITextTheme get lightGrey => _CTextTheme(color: ColorThemes.lightGrey);

  ///color: White
  static _ITextTheme get white => _CTextTheme(color: Colors.white);

  ///color: Error
  static _ITextTheme get error => _CTextTheme(color: Colors.red);
}

abstract class _ITextTheme {
  TextStyle get largeTitle;

  TextStyle get title1;

  TextStyle get title2;

  TextStyle get title3;

  TextStyle get headline;

  TextStyle get bodyBold;

  TextStyle get body;

  TextStyle get callout;

  TextStyle get subhead;

  TextStyle get footnote;

  TextStyle get caption1;

  TextStyle get caption2;
}

class _CTextTheme implements _ITextTheme {
  factory _CTextTheme({
    final FontWeight? weight,
    final Color? color,
  }) {
    final largeText = TextStyle(
      fontFamily: 'LoosWide',
      fontWeight: weight,
      color: color,
    );
    final smallText = TextStyle(
      fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      fontWeight: weight,
      color: color,
    );

    final largeTitle = largeText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 34,
    );

    final title1 = largeText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 28,
    );

    final title2 = largeText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 22,
    );

    final title3 = largeText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );

    final headline = largeText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );

    final body = smallText.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );

    final bodyBold = body.copyWith(
      fontWeight: FontWeight.w800,
    );

    final callout = smallText.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

    final subhead = smallText.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );

    final footnote = smallText.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );

    final caption1 = smallText.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

    final caption2 = smallText.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 11,
    );

    return _CTextTheme._(
      largeTitle,
      title1,
      title2,
      title3,
      headline,
      bodyBold,
      body,
      callout,
      subhead,
      footnote,
      caption1,
      caption2,
    );
  }
  _CTextTheme._(
    this._largeTitle,
    this._title1,
    this._title2,
    this._title3,
    this._headline,
    this._bodyBold,
    this._body,
    this._callout,
    this._subhead,
    this._footnote,
    this._caption1,
    this._caption2,
  );

  final TextStyle _largeTitle;
  final TextStyle _title1;
  final TextStyle _title2;
  final TextStyle _title3;
  final TextStyle _headline;
  final TextStyle _bodyBold;
  final TextStyle _body;
  final TextStyle _callout;
  final TextStyle _subhead;
  final TextStyle _footnote;
  final TextStyle _caption1;
  final TextStyle _caption2;

  @override
  TextStyle get largeTitle => _largeTitle;

  @override
  TextStyle get title1 => _title1;

  @override
  TextStyle get title2 => _title2;

  @override
  TextStyle get title3 => _title3;

  @override
  TextStyle get headline => _headline;

  @override
  TextStyle get body => _body;

  @override
  TextStyle get bodyBold => _bodyBold;

  @override
  TextStyle get callout => _callout;

  @override
  TextStyle get subhead => _subhead;

  @override
  TextStyle get footnote => _footnote;

  @override
  TextStyle get caption1 => _caption1;

  @override
  TextStyle get caption2 => _caption2;
}
