

import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class TextStyles {
    const TextStyles._();

    static const TextStyle displayLarge = TextStyle(fontSize: 57, color: MyColors.onPrimary);
    static const TextStyle displayMedium = TextStyle(fontSize: 42, color: MyColors.onPrimary);
    static const TextStyle displaySmall = TextStyle(fontSize: 36, color: MyColors.onPrimary);

    static const TextStyle titleLarge =  TextStyle(fontSize: 22, color: MyColors.onPrimary);
    static const TextStyle titleMedium = TextStyle(fontSize: 16, letterSpacing: 0.15, color: MyColors.onPrimary);
    static const TextStyle titleSmall = TextStyle(fontSize: 14, letterSpacing: 0.1, color: MyColors.onPrimary);

    static const TextStyle bodyLarge =  TextStyle(fontSize: 16, letterSpacing: 0.15, color: MyColors.neutral);
    static const TextStyle bodyMedium = TextStyle(fontSize: 14, letterSpacing: 0.25, color: MyColors.neutral);
    static const TextStyle bodySmall = TextStyle(fontSize: 10, letterSpacing: 0.4, color: MyColors.neutral);

    static const TextStyle dividerStyle = TextStyle(fontSize: 12, fontFamily: FontFamilies.museoSans100, color: MyColors.neutral);
}





