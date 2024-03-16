import 'package:flutter/material.dart';
import 'package:gmail_ui/state/navigation_notifier.dart';
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
          destinations: _buildNavigationRailDestinations(ref),
          selectedIndex: ref.selectedIndex,
        );
      },
    );
  }

  List<NavigationRailDestination> _buildNavigationRailDestinations(
    NavigationNotifier ref,
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
      _navigationRailDestinationWithBadge(
        icon: Icons.snooze_outlined,
        selectedIcon: Icons.snooze,
        label: "Snoozed",
        unreadCount: 10,
      ),
      _navigationRailDestinationWithBadge(
        icon: Icons.send_outlined,
        selectedIcon: Icons.send,
        label: "Sent",
        unreadCount: 0,
      ),
      _navigationRailDestinationWithBadge(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: "Draft",
        unreadCount: 0,
      ),
      _navigationRailDestination(
        icon: ref.moreVisible
            ? Icons.keyboard_arrow_up_rounded
            : Icons.keyboard_arrow_down_rounded,
        label: ref.moreVisible ? "Less" : "More",
        selectedIcon: ref.moreVisible
            ? Icons.keyboard_arrow_up_rounded
            : Icons.keyboard_arrow_down_rounded,
      ),
    ];

    if (ref.moreVisible) {
      destinations.addAll(
        [
          _navigationRailDestinationWithBadge(
            icon: Icons.label_important_outline_rounded,
            selectedIcon: Icons.label_important_rounded,
            label: "Important",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.chat_outlined,
            selectedIcon: Icons.chat,
            label: "Chats",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.schedule_send_outlined,
            selectedIcon: Icons.schedule_send,
            label: "Scheduled",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.mail_outline,
            selectedIcon: Icons.mail,
            label: "All Mail",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.info_outline,
            selectedIcon: Icons.info,
            label: "Spam",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.delete_outline,
            selectedIcon: Icons.delete,
            label: "Trash",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.label_outline,
            selectedIcon: Icons.label,
            label: "Categories",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings,
            label: "Manage labels",
            unreadCount: 0,
          ),
          _navigationRailDestinationWithBadge(
            icon: Icons.add_rounded,
            selectedIcon: Icons.add_rounded,
            label: "Create new label",
            unreadCount: 0,
          ),
        ],
      );
    }

    return destinations;
  }

  NavigationRailDestination _navigationRailDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    int unreadCount = 0,
  }) =>
      NavigationRailDestination(
        icon: Icon(icon),
        selectedIcon: Icon(selectedIcon),
        label: Text(label),
      );

  NavigationRailDestination _navigationRailDestinationWithBadge({
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
