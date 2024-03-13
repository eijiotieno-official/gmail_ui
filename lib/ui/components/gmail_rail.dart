import 'package:flutter/material.dart';
import 'package:gmail_ui/state/navigation_notifier.dart';
import 'package:gmail_ui/ui/components/gmail_navigation_icon.dart';
import 'package:provider/provider.dart';

class GmailRail extends StatelessWidget {
  const GmailRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, ref, child) {
        return NavigationRail(
          onDestinationSelected: (index) => ref.updateIndex(index),
          leading: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.create_rounded),
          ),
          labelType: NavigationRailLabelType.all,
          destinations: [
            const NavigationRailDestination(
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
            const NavigationRailDestination(
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
            const NavigationRailDestination(
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
            const NavigationRailDestination(
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
            const NavigationRailDestination(
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
            NavigationRailDestination(
              icon: GmailNavigationIcon(
                icon: ref.moreVisible
                    ? const Icon(Icons.keyboard_arrow_up_rounded)
                    : const Icon(Icons.keyboard_arrow_down_rounded),
                unreadCount: 0,
              ),
              label: ref.moreVisible ? const Text("Less") : const Text("More"),
            ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.label_important_outline_rounded),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.label_important_rounded),
                  unreadCount: 0,
                ),
                label: Text("Important"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.chat_outlined),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.chat),
                  unreadCount: 0,
                ),
                label: Text("Chats"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.schedule_send_outlined),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.schedule_send),
                  unreadCount: 0,
                ),
                label: Text("Scheduled"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.mail_outline),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.mail),
                  unreadCount: 0,
                ),
                label: Text("All Mail"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.info_outline),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.info),
                  unreadCount: 0,
                ),
                label: Text("Spam"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.delete_outline),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.delete),
                  unreadCount: 0,
                ),
                label: Text("Trash"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.label_outline),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.label),
                  unreadCount: 0,
                ),
                label: Text("Categories"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.settings_outlined),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.settings),
                  unreadCount: 0,
                ),
                label: Text("Manage labels"),
              ),
            if (ref.moreVisible)
              const NavigationRailDestination(
                icon: GmailNavigationIcon(
                  icon: Icon(Icons.add_rounded),
                  unreadCount: 0,
                ),
                selectedIcon: GmailNavigationIcon(
                  icon: Icon(Icons.add_rounded),
                  unreadCount: 0,
                ),
                label: Text("Create new label"),
              ),
          ],
          selectedIndex: ref.selectedIndex,
        );
      },
    );
  }
}
