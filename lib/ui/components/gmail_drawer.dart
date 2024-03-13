import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/navigation_index_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:provider/provider.dart';

import 'gmail_navigation_icon.dart';

class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationIndexNotifier>(
      builder: (context, navigationIndexRef, child) {
        return Consumer<ScreenTypeNotifier>(
          builder: (context, ref, child) {
            return NavigationDrawer(
              elevation: ref.screenType == ScreenType.desktop ? 0 : null,
              selectedIndex: navigationIndexRef.selectedIndex,
              onDestinationSelected: (index) =>
                  navigationIndexRef.update(index),
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person_rounded),
                  ),
                  title: Text("User name"),
                  subtitle: Text("example@gmail.com"),
                ),
                NavigationDrawerDestination(
                  icon: GmailNavigationIcon(
                    icon: Icon(Icons.inbox_outlined),
                    unreadCount: 5,
                  ),
                  selectedIcon: GmailNavigationIcon(
                    icon: Icon(Icons.inbox),
                    unreadCount: 5,
                  ),
                  label: Text("Inbox"),
                ),
                NavigationDrawerDestination(
                  icon: GmailNavigationIcon(
                    icon: Icon(Icons.star_outline),
                    unreadCount: 0,
                  ),
                  selectedIcon: GmailNavigationIcon(
                    icon: Icon(Icons.star),
                    unreadCount: 0,
                  ),
                  label: Text("Starred"),
                ),
                NavigationDrawerDestination(
                  icon: GmailNavigationIcon(
                    icon: Icon(Icons.snooze_outlined),
                    unreadCount: 10,
                  ),
                  selectedIcon: GmailNavigationIcon(
                    icon: Icon(Icons.snooze),
                    unreadCount: 10,
                  ),
                  label: Text("Snoozed"),
                ),
                NavigationDrawerDestination(
                  icon: GmailNavigationIcon(
                    icon: Icon(Icons.send_outlined),
                    unreadCount: 0,
                  ),
                  selectedIcon: GmailNavigationIcon(
                    icon: Icon(Icons.send),
                    unreadCount: 0,
                  ),
                  label: Text("Sent"),
                ),
                NavigationDrawerDestination(
                  icon: GmailNavigationIcon(
                    icon: Icon(Icons.drafts_outlined),
                    unreadCount: 0,
                  ),
                  selectedIcon: GmailNavigationIcon(
                    icon: Icon(Icons.drafts),
                    unreadCount: 0,
                  ),
                  label: Text("Draft"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
