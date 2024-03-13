import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:gmail_ui/state/navigation_index_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // Run the application
  runApp(
    MultiProvider(
      providers: [
        // Provide the SongsProvider with the loaded songs and SongHandler
        ChangeNotifierProvider(
          create: (context) => ScreenTypeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationIndexNotifier(),
        ),
      ],
      // Use the MainApp widget as the root of the application
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightDynamic,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic,
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
