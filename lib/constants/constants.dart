import 'package:flutter/material.dart';

//var kCursorColor = Colors.teal[900];
var kdarkColor = Color(0xff171d49);
var kTodoItemCardStyle = const TextStyle(fontSize: 20.0, color: Colors.white);

class AppThemes {
  final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff171d49),//Colors.blue,
    appBarTheme: AppBarTheme(
      color: Color(0xff171d49),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Color(0xff171d49),
      selectionHandleColor: Color(0xff005e91),
    ),
    //backgroundColor: Colors.white,
    brightness: Brightness.light,
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff171d49),//Colors.blue,
        focusColor: Colors.blueAccent,
        splashColor: Colors.lightBlue),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  ThemeData halloweenTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
  ));
}
