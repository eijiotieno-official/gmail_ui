import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/mail_view_model.dart';

class DetailAppBar extends ConsumerWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine the device screen type for responsive behavior
    DeviceScreenType screenType = getDeviceType(MediaQuery.sizeOf(context));

    return Padding(
      // Adjust the top padding based on screen type (only for desktop)
      padding: EdgeInsets.only(
        top: screenType == DeviceScreenType.desktop ? 16.0 : 0.0,
      ),
      child: AppBar(
        leading: _buildBackButton(context, ref, screenType),
        actions: [_buildActionButtons()],
      ),
    );
  }

  // Builds the back button with necessary navigation logic
  Widget _buildBackButton(
      BuildContext context, WidgetRef ref, DeviceScreenType screenType) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () {
        // Clear the opened mail state when navigating back
        ref.read(openedMailProvider.notifier).state = null;

        // Navigate back for mobile/tablet screens
        if (screenType == DeviceScreenType.mobile ||
            screenType == DeviceScreenType.tablet) {
          Navigator.pop(context);
        }
      },
    );
  }

  // Builds the row of action buttons (archive, delete, etc.)
  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconButton(Icons.archive_outlined, () {}),
        _buildIconButton(Icons.delete_outline_rounded, () {}),
        _buildIconButton(Icons.mark_email_unread_outlined, () {}),
        _buildPopupMenu(),
      ],
    );
  }

  // Creates a reusable IconButton widget
  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }

  // Builds the PopupMenu with multiple actions
  Widget _buildPopupMenu() {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          _buildPopupMenuItem("Move to"),
          _buildPopupMenuItem("Snooze"),
          _buildPopupMenuItem("Change labels"),
          _buildPopupMenuItem("Mark as important"),
          _buildPopupMenuItem("Mute"),
          _buildPopupMenuItem("Print all"),
          _buildPopupMenuItem("Report spam"),
          _buildPopupMenuItem("Add to tasks"),
          _buildPopupMenuItem("Help and feedback"),
        ];
      },
    );
  }

  // Helper function to create a PopupMenuItem
  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      onTap: () {},
      child: Text(title),
    );
  }
}
