
import 'package:demo_drift_package/constants/constants.dart';
import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'screens/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/drift_db.dart'; 
import 'package:flutter/services.dart'; // necessary for device orientation

void main() {
  runApp(
      //Enable riverpod for the entire application
      const ProviderScope(child: MyApp()));
}

// create provider we will be able to use everywhere on app
final todoDBProvider = 
Provider.autoDispose((ref) => TodoDatabase()); 
// autodispose -> avoid unnecessary cost and 
// restore state when provider is no longer in use

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  MaterialApp(
      title: kAppTitle,
      theme: AppThemes().lightTheme,//halloweenTheme,
      home: HomePage(),
    );
    // Check your state management tool for lifecycles (i.e. initialized / alive/ paused/ disposed)
    // dispose: (context, db) => db.close(),
    // dispose is a method from Provider,
    // Riverpod has autodispose, used appended in the provider itself
    // docs -> https://riverpod.dev/docs/concepts/modifiers/auto_dispose
  }
}