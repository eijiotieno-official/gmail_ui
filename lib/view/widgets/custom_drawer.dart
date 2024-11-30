import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/drawer_view_model.dart';
import '../../view_model/selected_index.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);

    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    return NavigationDrawer(
      elevation: screenType == DeviceScreenType.desktop ? 0 : null,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
        if (screenType == DeviceScreenType.mobile) {
          ref.read(drawerProvider.notifier).closeDrawer();
        }
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: _buildNavigationRailDestinations(context),
    );
  }

  List<Widget> _buildNavigationRailDestinations(BuildContext context) {
    final destinations = [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        currentAccountPicture: CircleAvatar(
          child: Icon(
            Icons.person_rounded,
            size: 25,
          ),
        ),
        currentAccountPictureSize: Size.fromRadius(25),
        otherAccountsPictures: [
          CircleAvatar(
            radius: 12.5,
            child: Icon(
              Icons.person_rounded,
              size: 12.5,
            ),
          ),
        ],
        otherAccountsPicturesSize: Size.fromRadius(15),
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
      ),
      _navigationDrawerDestination(
        icon: Icons.inbox_outlined,
        selectedIcon: Icons.inbox,
        label: "Inbox",
        unreadCount: 5,
      ),
      _navigationDrawerDestination(
        icon: Icons.star_outline,
        selectedIcon: Icons.star,
        label: "Starred",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.snooze_outlined,
        selectedIcon: Icons.snooze,
        label: "Snoozed",
        unreadCount: 10,
      ),
      _navigationDrawerDestination(
        icon: Icons.send_outlined,
        selectedIcon: Icons.send,
        label: "Sent",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: "Draft",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.label_important_outline_rounded,
        selectedIcon: Icons.label_important_rounded,
        label: "Important",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.chat_outlined,
        selectedIcon: Icons.chat,
        label: "Chats",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.schedule_send_outlined,
        selectedIcon: Icons.schedule_send,
        label: "Scheduled",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.mail_outline,
        selectedIcon: Icons.mail,
        label: "All Mail",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.info_outline,
        selectedIcon: Icons.info,
        label: "Spam",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.delete_outline,
        selectedIcon: Icons.delete,
        label: "Trash",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.label_outline,
        selectedIcon: Icons.label,
        label: "Categories",
        unreadCount: 0,
      ),
      const Divider(),
      _navigationDrawerDestination(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: "Manage labels",
        unreadCount: 0,
      ),
      _navigationDrawerDestination(
        icon: Icons.add_rounded,
        selectedIcon: Icons.add_rounded,
        label: "Create new label",
        unreadCount: 0,
      ),
    ];

    return destinations;
  }

  NavigationDrawerDestination _navigationDrawerDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int unreadCount,
  }) =>
      NavigationDrawerDestination(
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
