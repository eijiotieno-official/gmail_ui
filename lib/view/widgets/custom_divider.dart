import 'package:flutter/material.dart';

/// A customizable divider widget that uses the theme's hover color.
class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the theme's hoverColor for the divider's color
    return Container(
      color:
          Theme.of(context).hoverColor, // Apply the hover color from the theme
      height: 1, // Set the divider height to 1 pixel
      width: double
          .infinity, // Make the divider span the full width of the container
    );
  }
}
