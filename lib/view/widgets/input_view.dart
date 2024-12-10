import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final String? prefixText;
  final Widget? trailing;

  const InputView({
    super.key,
    required this.controller,
    this.keyboardType,
    this.onTap,
    this.prefixText,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap, // Handle tap gesture
        hoverColor: Theme.of(context).colorScheme.surface,
        focusColor: Theme.of(context).colorScheme.surface,
        splashColor: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            if (prefixText != null)
              _buildPrefixText(context), // Show prefix if provided
            _buildTextField(), // The actual input field
            if (trailing != null) trailing!, // Show trailing widget if provided
          ],
        ),
      ),
    );
  }

  // Builds the prefix text widget if provided
  Widget _buildPrefixText(BuildContext context) {
    return Text(
      "$prefixText  ",
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  // Builds the TextField widget
  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.zero, // Remove extra padding
        ),
      ),
    );
  }
}
