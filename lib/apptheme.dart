import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.solid, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.solid, color: Colors.blue),
        )),
        primaryColorLight: const Color(0xff2196f3),
    cardTheme: const CardTheme(color: Colors.white),
    primaryColor: const Color(0xff2196f3),
    highlightColor: const Color(0xff2196f3),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    iconTheme: const IconThemeData(color: Color(0xff2196f3)),
    listTileTheme: const ListTileThemeData(
      shape: Border(
          bottom: BorderSide(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xff2196f3), // background color
          textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: const Color(0xffe0e0e0),
      fillColor: const Color(0xffe0e0e0).withOpacity(0.1),
      textStyle: const TextStyle(color: Colors.white),
      selectedBorderColor: const Color(0xffe0e0e0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color.fromARGB(255, 0, 0, 0),
      onPrimary: const Color(0xff2196f3),
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.light,
    ));
