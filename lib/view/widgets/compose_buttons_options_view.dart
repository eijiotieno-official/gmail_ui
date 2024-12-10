import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// A widget displaying a row of action buttons for the compose screen.
class ComposeButtonsOptionsView extends StatelessWidget {
  const ComposeButtonsOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the buttons should be visible based on the screen size
    bool isVisible = getValueForScreenType(
      context: context,
      mobile: false,
      desktop: true,
      tablet: true,
    );

    // Only display the buttons on tablet or desktop
    return isVisible
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildFilledButton("Send", onPressed: () {}),
                _buildIconButton(Icons.text_format_rounded),
                _buildIconButton(Icons.attach_file_rounded),
                _buildIconButton(Icons.link_rounded),
                _buildIconButton(Icons.emoji_emotions_outlined),
                _buildIconButton(Icons.drive_folder_upload_outlined),
                _buildIconButton(Icons.schedule_send_outlined),
                _buildIconButton(Icons.create_outlined),
                _buildIconButton(Icons.more_vert_rounded),
                Spacer(),
                _buildIconButton(Icons.delete_outline_rounded),
              ],
            ),
          )
        : const SizedBox.shrink(); // Return an empty widget if not visible
  }

  /// Creates a reusable FilledButton widget.
  Widget _buildFilledButton(String label, {required VoidCallback onPressed}) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  /// Creates a reusable IconButton widget.
  Widget _buildIconButton(IconData icon, {VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
