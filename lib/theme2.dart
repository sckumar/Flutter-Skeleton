import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5496D7)),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      checkboxTheme: CheckboxThemeData(
        side: MaterialStateBorderSide.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const BorderSide(width: 0.0, color: Color(0xff86D6DD));
            }
            return const BorderSide(width: 2.0, color: Color(0xffDCD4D4));
          },
        ),
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xff86D6DD);
          }
          return Colors.transparent;
        }),
      ),
    );
  }
}
