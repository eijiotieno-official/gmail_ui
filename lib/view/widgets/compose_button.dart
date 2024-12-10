import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../pages/compose_page.dart';

class ComposeButton extends ConsumerWidget {
  const ComposeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine device screen type for responsive UI
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    // Boolean to determine if extended button is required
    bool showExtended = screenType == DeviceScreenType.desktop ||
        screenType == DeviceScreenType.mobile;

    // Function to navigate to ComposePage or show dialog for desktop
    void onPressed() {
      if (screenType == DeviceScreenType.mobile) {
        _navigateToComposePage(context); // Navigate for mobile
      } else {
        _showComposeDialog(context); // Show dialog for desktop
      }
    }

    // Return the appropriate FloatingActionButton based on screen size
    return showExtended
        ? _buildExtendedButton(onPressed)
        : _buildCompactButton(onPressed);
  }

  // Navigate to ComposePage when in mobile view
  void _navigateToComposePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComposePage()),
    );
  }

  // Show dialog with ComposePage for larger screens
  void _showComposeDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600,
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: const ComposePage(),
            ),
          ),
        ),
      ),
    );
  }

  // Builds the extended FloatingActionButton (with label)
  Widget _buildExtendedButton(VoidCallback onPressed) {
    return FloatingActionButton.extended(
      elevation: 0,
      onPressed: onPressed,
      icon: const Icon(Icons.create_rounded),
      label: const Text("Compose"),
    );
  }

  // Builds the compact FloatingActionButton (without label)
  Widget _buildCompactButton(VoidCallback onPressed) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: onPressed,
      child: const Icon(Icons.create_rounded),
    );
  }
}
