import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'screens/home_page.dart';
import 'package:flutter/services.dart'; // necessary for device orientation 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
         SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.green, // TODO: CREATE A CONSTANT , EXPORT THEME CODE INTO A CONSTANT 
      ),
      home: const HomePage(),
    );
  }
}