import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/screens/compose_screen.dart';
import 'package:provider/provider.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenTypeNotifier = context.watch<ScreenTypeNotifier>();

    final screenType = screenTypeNotifier.screenType;

    return screenType == ScreenType.desktop || screenType == ScreenType.mobile
        ? FloatingActionButton.extended(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ComposeScreen();
                },
              ),
            ),
            icon: const Icon(Icons.create_rounded),
            label: const Text("Compose"),
          )
        : FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ComposeScreen();
                },
              ),
            ),
            child: const Icon(Icons.create_rounded),
          );
  }
}
