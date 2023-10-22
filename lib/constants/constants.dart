import 'package:flutter/material.dart';

var kdarkColor = const Color(0xff171d49);
var kTodoItemCardStyle = const TextStyle(fontSize: 20.0, color: Colors.white);

class AppThemes {
  final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff171d49),
    appBarTheme: const AppBarTheme(
      color: Color(0xff171d49),
    ),

textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Color(0xff171d49),
      selectionHandleColor: Color(0xff005e91),
    ),

highlightColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff171d49),//Colors.blue,
       focusColor: Colors.blueAccent,
       splashColor: Colors.lightBlue),
   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),

inputDecorationTheme: const InputDecorationTheme(
border: OutlineInputBorder(
borderSide: BorderSide(color: Color(0xff171d49),
),
),

   ),
  );

  ThemeData halloweenTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
  ));
}
