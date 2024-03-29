import 'package:flutter/material.dart';
import 'package:gmail_ui/data/databases/mail_database.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/drawer_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/components/gmail_drawer.dart';
import 'package:gmail_ui/ui/components/gmail_rail.dart';
import 'package:gmail_ui/ui/components/gmail_search_bar.dart';
import 'package:gmail_ui/ui/components/mail_list.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    MailDatabase.getAll(20);
    super.initState();
  }

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
            return Scaffold(
              key: drawerRef.globalKey,
              drawer: type == ScreenType.mobile ? const GmailDrawer() : null,
              body: Row(
                children: [
                  if (type != ScreenType.mobile) const GmailRail(),
                  // if (screenTypeRef.screenType == ScreenType.desktop)
                  //   const GmailDrawer(),
                  Expanded(
                    child: Column(
                      children: [
                        const GmailSearchBar(),
                        MailList(mails: MailDatabase.data),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton:
                  type == ScreenType.mobile
                      ? FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.create_rounded),
                        )
                      : null,
            );
          },
        );
      },
    );
  }
}
