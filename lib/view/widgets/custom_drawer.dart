import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/drawer_view_model.dart';
import '../../view_model/selected_index.dart';

/// A custom navigation drawer widget with responsive behavior.
class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current selected index from the provider
    int selectedIndex = ref.watch(selectedIndexProvider);

    // Determine the screen type (mobile, tablet, or desktop)
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    return NavigationDrawer(
      elevation: screenType == DeviceScreenType.desktop ? 0 : null,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
        // Close the drawer on mobile when a destination is selected
        if (screenType == DeviceScreenType.mobile) {
          ref.read(drawerProvider.notifier).closeDrawer();
        }
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: _buildNavigationRailDestinations(context),
    );
  }

  /// Builds the list of destinations (menu items) for the navigation drawer.
  List<Widget> _buildNavigationRailDestinations(BuildContext context) {
    final destinations = [
      _buildUserAccountHeader(context),
      _buildNavigationDrawerDestination(
        icon: Icons.inbox_outlined,
        selectedIcon: Icons.inbox,
        label: "Inbox",
        unreadCount: 5,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.star_outline,
        selectedIcon: Icons.star,
        label: "Starred",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.snooze_outlined,
        selectedIcon: Icons.snooze,
        label: "Snoozed",
        unreadCount: 10,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.send_outlined,
        selectedIcon: Icons.send,
        label: "Sent",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: "Draft",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.label_important_outline_rounded,
        selectedIcon: Icons.label_important_rounded,
        label: "Important",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.chat_outlined,
        selectedIcon: Icons.chat,
        label: "Chats",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.schedule_send_outlined,
        selectedIcon: Icons.schedule_send,
        label: "Scheduled",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.mail_outline,
        selectedIcon: Icons.mail,
        label: "All Mail",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.info_outline,
        selectedIcon: Icons.info,
        label: "Spam",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.delete_outline,
        selectedIcon: Icons.delete,
        label: "Trash",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.label_outline,
        selectedIcon: Icons.label,
        label: "Categories",
        unreadCount: 0,
      ),
      const Divider(),
      _buildNavigationDrawerDestination(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: "Manage labels",
        unreadCount: 0,
      ),
      _buildNavigationDrawerDestination(
        icon: Icons.add_rounded,
        selectedIcon: Icons.add_rounded,
        label: "Create new label",
        unreadCount: 0,
      ),
    ];

    return destinations;
  }

  /// Builds the user account header for the navigation drawer.
  Widget _buildUserAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      currentAccountPicture: CircleAvatar(
        child: Icon(
          Icons.person_rounded,
          size: 25,
        ),
      ),
      currentAccountPictureSize: const Size.fromRadius(25),
      otherAccountsPictures: [
        CircleAvatar(
          radius: 12.5,
          child: Icon(
            Icons.person_rounded,
            size: 12.5,
          ),
        ),
      ],
      otherAccountsPicturesSize: const Size.fromRadius(15),
      accountName: Text(
        "User name",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Theme.of(context).textTheme.titleMedium?.color,
          fontWeight: Theme.of(context).textTheme.titleMedium?.fontWeight,
        ),
      ),
      accountEmail: Text(
        "example@gmail.com",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Theme.of(context).textTheme.labelMedium?.color,
        ),
      ),
    );
  }

  /// Creates a navigation drawer destination (menu item) with a badge for unread count.
  NavigationDrawerDestination _buildNavigationDrawerDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int unreadCount,
  }) {
    return NavigationDrawerDestination(
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
}
