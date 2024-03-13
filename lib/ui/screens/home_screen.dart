import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/components/gmail_drawer.dart';
import 'package:gmail_ui/ui/components/gmail_rail.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              drawer: screenTypeRef.screenType == ScreenType.mobile
                  ? const GmailDrawer()
                  : null,
              appBar: AppBar(),
              body: Row(
                children: [
                  if (screenTypeRef.screenType == ScreenType.tablet)
                    const GmailRail(),
                  if (screenTypeRef.screenType == ScreenType.desktop)
                    const GmailDrawer(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
