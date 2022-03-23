import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData myTheme = ThemeData(
  colorScheme: _colorScheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  tabBarTheme: _tabBarTheme,
  textSelectionTheme: _textSelectionTheme,
  // scaffoldBackgroundColor: MyColors.white,
  // textTheme: myTextTheme,
  // primaryTextTheme: myTextTheme,
  // tabBarTheme: _tabBarTheme,
  // inputDecorationTheme: _inputDecorationTheme,
  // colorScheme: _colorScheme,
  // dividerColor: Colors.black,
  // dividerTheme: _dividerThemeData,
  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: MyColors.accent,
  //   selectionColor: MyColors.primary,
  //   selectionHandleColor: MyColors.accent,
  // ),
  // outlinedButtonTheme: _outlinedButtonThemeData,
  // textButtonTheme: _textButtonThemeData,
);

class _MyColors {
  const _MyColors._();

  static const Color primary = Color(0xff0a0f1e); // Buttons
  static const Color onPrimary = Colors.white; // On Buttons
  static const Color onSurface = Color(0xff454d59); // Text Field Decoration
  static const Color background = Color(0xffe8e9ea); // BackGround of splash

  static const Color selectionColor = Color(0xffcecfd2);
}

ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: _MyColors.primary,
  onPrimary: _MyColors.onPrimary,
  onSurface: _MyColors.onSurface,
  background: _MyColors.background,
  primaryContainer: Colors.pink,
  onPrimaryContainer: Colors.pink,
  inversePrimary: Colors.pink,
  secondary: Colors.red,
  onSecondary: Colors.red,
  secondaryContainer: Colors.red,
  onSecondaryContainer: Colors.red,
  tertiary: Colors.purple,
  onTertiary: Colors.purple,
  tertiaryContainer: Colors.purple,
  onTertiaryContainer: Colors.purple,
  error: Colors.green,
  onError: Colors.green,
  errorContainer: Colors.green,
  onErrorContainer: Colors.green,
  onBackground: Colors.lightGreenAccent,
  surface: Colors.red,
  surfaceVariant: Colors.yellow,
  onSurfaceVariant: Colors.yellow,
  inverseSurface: Colors.yellow,
  onInverseSurface: Colors.yellow,
  outline: Colors.orange,
  shadow: Colors.orange,
  brightness: Brightness.light,
);

ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
    elevation: MaterialStateProperty.all(0),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  ),
);

TabBarTheme _tabBarTheme = const TabBarTheme(
  labelColor: _MyColors.primary,
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(
      width: 2,
    ),
  ),
);

TextSelectionThemeData _textSelectionTheme = const TextSelectionThemeData(
  selectionColor: _MyColors.selectionColor,
  selectionHandleColor: _MyColors.onSurface,
);
