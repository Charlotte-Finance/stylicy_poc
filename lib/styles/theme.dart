import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData myTheme = ThemeData(
  colorScheme: _colorScheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  textButtonTheme: _textButtonTheme,
  tabBarTheme: _tabBarTheme,
  textSelectionTheme: _textSelectionTheme,
  appBarTheme: _appBarTheme,
  bottomNavigationBarTheme: _bottomNavigationBarTheme,
  disabledColor: Colors.blueAccent,
  buttonTheme: ButtonThemeData(disabledColor: Colors.blue),

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
  static const Color background =
      Color(0xffe8e9ea); // BackGround of splash screen
  static const Color surface = Color(0xffB8B8B8); // AppBar

  static const Color selectionColor = Color(0xffcecfd2); // Text selection color
  static const Color accent = Color(0xffb33661); // Text selection color
}

ColorScheme _colorScheme = const ColorScheme(
  primary: _MyColors.primary,
  onPrimary: _MyColors.onPrimary,
  onSurface: _MyColors.onSurface,
  background: _MyColors.background,
  surface: _MyColors.surface,
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
  surfaceVariant: Colors.yellow,
  onSurfaceVariant: Colors.yellow,
  inverseSurface: Colors.yellow,
  onInverseSurface: Colors.yellow,
  outline: Colors.orange,
  shadow: Colors.orange,
  brightness: Brightness.light,
);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {

         if (states.contains(MaterialState.disabled))
          return _MyColors.surface.withOpacity(0.5);
         else
           return _MyColors.primary;
      },
    ),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
    elevation: MaterialStateProperty.all(0),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  ),
);
TextButtonThemeData _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    primary: _MyColors.accent, // Text Color
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

AppBarTheme _appBarTheme = const AppBarTheme(
  color: _MyColors.surface,
  elevation: 1,
);

BottomNavigationBarThemeData _bottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  selectedItemColor: _MyColors.accent,
  unselectedItemColor: _MyColors.onSurface,
);

/*
class MySystemUiOverlayStyle {
  MySystemUiOverlayStyle._();

  static const light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,

    systemNavigationBarColor: Colors.white, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const dark = SystemUiOverlayStyle(
    statusBarColor: Colors.black, // status bar color
    statusBarIconBrightness: Brightness.light,

    systemNavigationBarColor: Colors.black, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
*/
