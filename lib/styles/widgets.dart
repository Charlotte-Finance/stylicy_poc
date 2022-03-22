part of 'theme.dart';

ButtonStyle greyButtonStyle = OutlinedButton.styleFrom(
  primary: MyColors.neutral,
);

TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
  style: OutlinedButton.styleFrom(
    primary: MyColors.accent,
  ),
);

OutlinedButtonThemeData _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    backgroundColor: MyColors.primary,
    primary: MyColors.onPrimary,
    side: const BorderSide(
      color: MyColors.primary,
    ),
  ),
);

DividerThemeData _dividerThemeData = const DividerThemeData(color: MyColors.outlinedColor);
