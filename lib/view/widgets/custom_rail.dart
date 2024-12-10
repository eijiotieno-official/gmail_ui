import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/drawer_view_model.dart';
import '../../view_model/selected_index.dart';
import 'compose_button.dart';

/// Custom navigation rail that adapts to different screen sizes.
class CustomRail extends ConsumerWidget {
  const CustomRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    
    final screenType = getDeviceType(MediaQuery.of(context).size);

    // Determine if the drawer should be shown or hidden based on screen size.
    final hideDrawer = screenType == DeviceScreenType.mobile;

    return hideDrawer
        ? const SizedBox
            .shrink() // No rail on mobile, just return an empty widget.
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildComposeButton(context),
              _buildNavigationRail(
                context,
                selectedIndex,
                screenType,
                ref,
              ),
            ],
          );
  }

  /// Builds the compose button at the top of the rail.
  Widget _buildComposeButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(
          getValueForScreenType<double>(
            context: context,
            mobile: 8,
            tablet: 16,
            desktop: 16,
          ),
        ),
        child: const ComposeButton(),
      ),
    );
  }

  /// Builds the navigation rail with mail categories and other destinations.
  Widget _buildNavigationRail(
    BuildContext context,
    int selectedIndex,
    DeviceScreenType screenType,
    WidgetRef ref,
  ) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicHeight(
          child: NavigationRail(
            onDestinationSelected: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
              if (screenType == DeviceScreenType.mobile) {
                ref.read(drawerProvider.notifier).closeDrawer();
              }
            },
            extended: screenType == DeviceScreenType.desktop,
            destinations: _buildNavigationRailDestinations(context),
            selectedIndex: selectedIndex,
          ),
        ),
      ),
    );
  }

  /// Builds the destinations for the navigation rail (e.g., Inbox, Starred, etc.).
  List<NavigationRailDestination> _buildNavigationRailDestinations(
      BuildContext context) {
    final destinations = [
      _navigationRailDestination(
        icon: Icons.inbox_outlined,
        selectedIcon: Icons.inbox,
        label: "Inbox",
        unreadCount: 5,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.star_outline,
        selectedIcon: Icons.star,
        label: "Starred",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.snooze_outlined,
        selectedIcon: Icons.snooze,
        label: "Snoozed",
        unreadCount: 10,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.send_outlined,
        selectedIcon: Icons.send,
        label: "Sent",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: "Draft",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.label_important_outline_rounded,
        selectedIcon: Icons.label_important_rounded,
        label: "Important",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.chat_outlined,
        selectedIcon: Icons.chat,
        label: "Chats",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.schedule_send_outlined,
        selectedIcon: Icons.schedule_send,
        label: "Scheduled",
        unreadCount: 5,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.mail_outline,
        selectedIcon: Icons.mail,
        label: "All Mail",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.info_outline,
        selectedIcon: Icons.info,
        label: "Spam",
        unreadCount: 9,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.delete_outline,
        selectedIcon: Icons.delete,
        label: "Trash",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.label_outline,
        selectedIcon: Icons.label,
        label: "Categories",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: "Manage labels",
        unreadCount: 0,
        context: context,
      ),
      _navigationRailDestination(
        icon: Icons.add_rounded,
        selectedIcon: Icons.add_rounded,
        label: "Create new label",
        unreadCount: 0,
        context: context,
      ),
    ];

    return destinations;
  }

  /// Builds a single navigation rail destination with a badge for unread count.
  NavigationRailDestination _navigationRailDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int unreadCount,
    required BuildContext context,
  }) {
    double fontSize = getValueForScreenType<double>(
      context: context,
      mobile: 14,
      tablet: 14,
      desktop: 16,
    );
    return NavigationRailDestination(
      padding: EdgeInsets.zero,
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
      label: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
