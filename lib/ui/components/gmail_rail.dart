import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/navigation_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:provider/provider.dart';

class GmailRail extends StatelessWidget {
  const GmailRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, navigationRef, child) {
        return Consumer<ScreenTypeNotifier>(
          builder: (context, typeRef, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    onDestinationSelected: (index) =>
                        navigationRef.updateIndex(index),
                    leading: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.create_rounded),
                    ),
                    extended: typeRef.screenType == ScreenType.desktop,
                    destinations:
                        _buildNavigationRailDestinations(navigationRef),
                    selectedIndex: navigationRef.selectedIndex,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<NavigationRailDestination> _buildNavigationRailDestinations(
    NavigationNotifier navigationRef,
  ) {
    final destinations = [
      _navigationRailDestination(
        icon: Icons.inbox_outlined,
        selectedIcon: Icons.inbox,
        label: "Inbox",
        unreadCount: 5,
      ),
      _navigationRailDestination(
        icon: Icons.star_outline,
        selectedIcon: Icons.star,
        label: "Starred",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.snooze_outlined,
        selectedIcon: Icons.snooze,
        label: "Snoozed",
        unreadCount: 10,
      ),
      _navigationRailDestination(
        icon: Icons.send_outlined,
        selectedIcon: Icons.send,
        label: "Sent",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: "Draft",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.label_important_outline_rounded,
        selectedIcon: Icons.label_important_rounded,
        label: "Important",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.chat_outlined,
        selectedIcon: Icons.chat,
        label: "Chats",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.schedule_send_outlined,
        selectedIcon: Icons.schedule_send,
        label: "Scheduled",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.mail_outline,
        selectedIcon: Icons.mail,
        label: "All Mail",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.info_outline,
        selectedIcon: Icons.info,
        label: "Spam",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.delete_outline,
        selectedIcon: Icons.delete,
        label: "Trash",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.label_outline,
        selectedIcon: Icons.label,
        label: "Categories",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: "Manage labels",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: Icons.add_rounded,
        selectedIcon: Icons.add_rounded,
        label: "Create new label",
        unreadCount: 0,
      ),
    ];

    return destinations;
  }

  NavigationRailDestination _navigationRailDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int unreadCount,
  }) =>
      NavigationRailDestination(
        icon: Badge.count(
          isLabelVisible: unreadCount > 0,
          count: unreadCount,
          child: Icon(icon),
        ),
        selectedIcon: Badge.count(
          isLabelVisible: unreadCount > 0,
          count: unreadCount,
          child: Icon(selectedIcon),
        ),
        label: Text(label),
      );
}
