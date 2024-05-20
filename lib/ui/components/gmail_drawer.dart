import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/drawer_notifier.dart';
import 'package:gmail_ui/state/navigation_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:provider/provider.dart';

class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenTypeNotifier screenTypeNotifier =
        Provider.of<ScreenTypeNotifier>(context, listen: false);

    final screenType = screenTypeNotifier.screenType;

    return NavigationDrawer(
      elevation: screenType == ScreenType.desktop ? 0 : null,
      selectedIndex: context.watch<NavigationNotifier>().selectedIndex,
      onDestinationSelected: (index) {
        context.read<NavigationNotifier>().updateIndex(index);
        if (screenType == ScreenType.mobile) {
          context.read<DrawerNotifier>().closeDrawer();
        }
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: _buildNavigationRailDestinations(),
    );
  }

  List<Widget> _buildNavigationRailDestinations() {
    final destinations = [
      const UserAccountsDrawerHeader(
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
        ),
        accountEmail: Text(
          "example@gmail.com",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
