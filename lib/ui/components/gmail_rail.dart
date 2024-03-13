import 'package:flutter/material.dart';
import 'package:gmail_ui/state/navigation_index_notifier.dart';
import 'package:gmail_ui/ui/components/gmail_navigation_icon.dart';
import 'package:provider/provider.dart';

class GmailRail extends StatelessWidget {
  const GmailRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationIndexNotifier>(
      builder: (context, ref, child) {
        return NavigationRail(
          onDestinationSelected: (index) => ref.update(index),
          leading: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.create_rounded),
          ),
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
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
            NavigationRailDestination(
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
            NavigationRailDestination(
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
            NavigationRailDestination(
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
            NavigationRailDestination(
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
          selectedIndex: ref.selectedIndex,
        );
      },
    );
  }
}
