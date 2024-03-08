import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenTypeNotifier>(
      builder: (context, screenTypeRef, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            ScreenType type = constraints.maxWidth < 600
                ? ScreenType.mobile
                : constraints.maxWidth < 1200
                    ? ScreenType.tablet
                    : ScreenType.desktop;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              screenTypeRef.update(type);
            });
            return Scaffold(
              backgroundColor: screenTypeRef.screenType == ScreenType.mobile
                  ? Colors.red
                  : Colors.green,
              appBar: AppBar(
                title: Text(type.name),
              ),
            );
          },
        );
      },
    );
  }
}
