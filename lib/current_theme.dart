import 'package:flutter/material.dart';

class CurrentTheme {
  static ThemeData get apply {
    const TextStyle headlineStyle = TextStyle(
      fontSize: 90,
      fontFamily: 'Caveat',
      fontWeight: FontWeight.bold,
    );

    const TextStyle bodyStyle = TextStyle(
      fontSize: 13,
      height: 1.3,
      fontFamily: 'Jetbrains-Mono',
      decoration: TextDecoration.underline,
      overflow: TextOverflow.ellipsis,
    );

    TextTheme textTheme =
        Typography.englishLike2021.apply(displayColor: Colors.black).copyWith(
              headlineLarge: headlineStyle,
              bodyLarge: bodyStyle,
              bodyMedium: bodyStyle.copyWith(fontSize: 12),
              bodySmall: bodyStyle.copyWith(fontSize: 10),
            );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC08ECE)),
      textTheme: textTheme,
    );
  }
}
