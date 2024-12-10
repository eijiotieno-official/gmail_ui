import 'package:device_preview/device_preview.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'view/pages/home_page.dart';

/// Entry point of the application.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled:
          !kReleaseMode, // Activate Device Preview only in debug or profile mode.
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );
}

/// The main application widget with dynamic theming and responsiveness.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      // Builds the app with dynamic colors for light and dark themes.
      builder: (lightDynamic, darkDynamic) => ResponsiveApp(
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system, // Matches the system's light/dark mode.
          theme: _createTheme(lightDynamic, Brightness.light),
          darkTheme: _createTheme(darkDynamic, Brightness.dark),
          home: const HomePage(),
        ),
      ),
    );
  }

  /// Creates a ThemeData based on dynamic colors and brightness.
  ThemeData _createTheme(ColorScheme? dynamicScheme, Brightness brightness) {
    return ThemeData(
      useMaterial3: true, // Enables Material 3 design principles.
      colorScheme: dynamicScheme ??
          ColorScheme.fromSeed(
            seedColor:
                Colors.blue, // Fallback seed color if dynamicScheme is null.
            brightness: brightness,
          ),
    );
  }
}
