import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paddle_trac_admin_dashboard/routes/router.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/text_themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _goRouter;
  @override
  void initState() {
    super.initState();
    _goRouter = getIt<AppRouter>().router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admin Dashboard',
      theme: ThemeData(
        fontFamily: GoogleFonts.spaceMono().fontFamily,
        scaffoldBackgroundColor: ColorThemes.lightGrey,
        colorScheme: const ColorScheme.light(
          primary: ColorThemes.primary,
          secondary: ColorThemes.secondary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextThemes.primary.headline,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          hintStyle: TextThemes.secondary.body,
          labelStyle: TextThemes.secondary.body,
          errorStyle:
              TextThemes.error.footnote.copyWith(color: context.errorColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorThemes.primary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorThemes.lightGrey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorThemes.alert.lighten(.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorThemes.alert),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorThemes.lightGrey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textTheme: TextTheme(
          displayMedium: TextThemes.primary.largeTitle,
          headlineLarge: TextThemes.primary.title1,
          headlineMedium: TextThemes.primary.title2,
          headlineSmall: TextThemes.primary.title3,
          titleLarge: TextThemes.primary.headline,
          titleMedium: TextThemes.primary.body,
          titleSmall: TextThemes.primary.bodyBold,
          bodyLarge: TextThemes.primary.body, //Text Field Font Style
          bodyMedium: TextThemes.secondary.callout,
          bodySmall: TextThemes.secondary.subhead,
          labelLarge: TextThemes.secondary.footnote,
          labelMedium: TextThemes.secondary.caption1,
          labelSmall: TextThemes.secondary.caption2,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: TextThemes.primary.bodyBold,
            backgroundColor: Colors.transparent,
            foregroundColor: ColorThemes.secondary,
          ),
        ),
      ),
      routerConfig: _goRouter,
    );
  }
}

extension ThemeX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle get largeTitle => textTheme.displayMedium!;
  TextStyle get title1 => textTheme.headlineLarge!;
  TextStyle get title2 => textTheme.headlineMedium!;
  TextStyle get title3 => textTheme.headlineSmall!;
  TextStyle get headline => textTheme.titleLarge!;
  TextStyle get headlineBold =>
      textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800);
  TextStyle get bodyBold => textTheme.titleSmall!;
  TextStyle get body => textTheme.bodyLarge!;
  TextStyle get callout => textTheme.bodyMedium!
      .copyWith(color: Colors.white, fontWeight: FontWeight.w700);
  TextStyle get subhead => textTheme.bodySmall!;
  TextStyle get subheadBold => textTheme.bodySmall!
      .copyWith(fontWeight: FontWeight.w800, color: ColorThemes.primary);
  TextStyle get footnote => textTheme.labelLarge!;
  TextStyle get caption1 => textTheme.labelMedium!;
  TextStyle get caption2 => textTheme.labelSmall!.copyWith(color: Colors.white);

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get tertiaryColor => colorScheme.tertiary;
  Color get primaryTextColor => colorScheme.onPrimary;
  Color get secondaryTextColor => colorScheme.onSecondary;
  Color get lightColor => colorScheme.surface;
  Color get lightTextColor => colorScheme.onSurface;
  Color get darkColor => colorScheme.surface;
  Color get darkTextColor => colorScheme.onSurface;
  Color get errorColor => colorScheme.error;
  Color get errorTextColor => colorScheme.onError;
}
