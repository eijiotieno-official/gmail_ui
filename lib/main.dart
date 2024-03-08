import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightDynamic,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic,
            useMaterial3: true,
          ),
          home: Scaffold(
            body: Center(
              child: Text('Hello World!'),
            ),
          ),
        );
      },
    );
  }
}
