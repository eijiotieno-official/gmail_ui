import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/drawer_notifier.dart';
import 'package:gmail_ui/state/mail_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/components/compose_components/compose_button.dart';
import 'package:gmail_ui/ui/components/gmail_drawer.dart';
import 'package:gmail_ui/ui/components/gmail_rail.dart';
import 'package:gmail_ui/ui/components/gmail_search_bar.dart';
import 'package:gmail_ui/ui/components/mail_list.dart';
import 'package:gmail_ui/ui/screens/compose_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenTypeNotifier screenTypeNotifier =
        Provider.of<ScreenTypeNotifier>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenType type = constraints.maxWidth < 600
            ? ScreenType.mobile
            : constraints.maxWidth < 1200
                ? ScreenType.tablet
                : ScreenType.desktop;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          screenTypeNotifier.update(type);
        });
        return Consumer<DrawerNotifier>(
          builder: (context, drawerRef, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                // Set the system navigation bar color based on the theme's surface color
                systemNavigationBarColor: Theme.of(context).colorScheme.surface,
                statusBarColor: Theme.of(context).colorScheme.surface,

                // Adjust the navigation bar icon brightness based on the theme brightness
                systemNavigationBarIconBrightness:
                    Theme.of(context).brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,

                statusBarIconBrightness:
                    Theme.of(context).brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
              child: Scaffold(
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight + 50),
                  child: GmailSearchBar(),
                ),
                key: drawerRef.globalKey,
                drawer: type == ScreenType.mobile ? const GmailDrawer() : null,
                body: Row(
                  children: [
                    if (type != ScreenType.mobile) const GmailRail(),
                    Expanded(
                      child:
                          MailList(mails: context.watch<MailNotifier>().mails),
                    ),
                  ],
                ),
                floatingActionButton:
                    type == ScreenType.mobile ? const ComposeButton() : null,
              ),
            );
          },
        );
      },
    );
  }
}
