import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// A custom AppBar for the Compose screen that adapts to different screen sizes.
class ComposeAppBar extends StatelessWidget {
  const ComposeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the screen size type (mobile, tablet, or desktop)
    DeviceScreenType screenType = getDeviceType(MediaQuery.sizeOf(context));

    return AppBar(
      leading: _buildLeadingIcon(screenType, context),
      actions: [
        if (screenType == DeviceScreenType.mobile) _buildActionButtons(),
      ],
    );
  }

  /// Builds the leading icon based on the screen size.
  Widget _buildLeadingIcon(DeviceScreenType screenType, BuildContext context) {
    // Show a back button on mobile or a close button on larger screens
    return IconButton(
      icon: Icon(
        screenType == DeviceScreenType.mobile
            ? Icons.arrow_back_rounded
            : Icons.close_rounded,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  /// Builds the action buttons displayed on mobile devices.
  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min, // Ensure actions are aligned to the right
      children: [
        _buildIconButton(Icons.attach_file_rounded),
        _buildIconButton(Icons.send_rounded),
        _buildPopupMenu(),
      ],
    );
  }

  /// A reusable method to create an icon button.
  Widget _buildIconButton(IconData icon) {
    return IconButton(
      onPressed: () {}, // Define button action here
      icon: Icon(icon),
    );
  }

  /// Builds the PopupMenuButton with various options.
  Widget _buildPopupMenu() {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      itemBuilder: (context) {
        // Define a list of menu items
        return [
          _buildPopupMenuItem("Schedule send"),
          _buildPopupMenuItem("Add from Contacts"),
          _buildPopupMenuItem("Confidential mode"),
          _buildPopupMenuItem("Save draft"),
          _buildPopupMenuItem("Discard"),
          _buildPopupMenuItem("Settings"),
          _buildPopupMenuItem("Help and feedback"),
        ];
      },
    );
  }

  /// Reusable method to create a PopupMenuItem.
  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    return PopupMenuItem(
      value: text,
      onTap: () {}, // Define action on tap
      child: Text(text),
    );
  }
}
