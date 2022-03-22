import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/fonts.dart';
import '../utils/constants/text_styles.dart';

part 'texts.dart';
part 'widgets.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: MyColors.white,
  textTheme: myTextTheme,
  primaryTextTheme: myTextTheme,
  tabBarTheme: _tabBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  colorScheme: _colorScheme,
  dividerColor: Colors.black,
  dividerTheme: _dividerThemeData,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: MyColors.accent,
    selectionColor: MyColors.primary,
    selectionHandleColor: MyColors.accent,
  ),
  outlinedButtonTheme: _outlinedButtonThemeData,
  textButtonTheme: _textButtonThemeData,
);

TabBarTheme _tabBarTheme = const TabBarTheme(
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(
      color: MyColors.onPrimary,
      width: 2,
    ),
  ),
);

InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: MyColors.outlinedColor)),
  labelStyle: TextStyle(
    color: MyColors.neutral,
    fontFamily: FontFamilies.museoSans100,
    fontSize: 15,
  ),
  floatingLabelStyle: TextStyle(
    color: MyColors.neutral,
    fontFamily: FontFamilies.museoSans100,
    fontSize: 16,
  ),
);

ColorScheme _colorScheme = ColorScheme.fromSeed(
  seedColor: MyColors.primary,
  primary: MyColors.primary,
  onPrimary: MyColors.onPrimary,
  secondary: MyColors.primary,
  tertiary: MyColors.accent,
);
