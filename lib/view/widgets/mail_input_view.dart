import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MailInput extends ConsumerWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const MailInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: Theme.of(context)
              .colorScheme
              .primaryContainer, // Background color
        ),
        child: Row(
          children: [
            _buildAttachButton(), // Attach file button
            _buildTextField(), // The input field for typing the reply
            _buildSendButton(), // Send button
          ],
        ),
      ),
    );
  }

  // Builds the attach file button
  Widget _buildAttachButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {}, // Handle attachment logic
        icon: const Icon(Icons.attach_file_rounded),
      ),
    );
  }

  // Builds the TextField widget for input
  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        controller: controller,
        maxLines: null, // Allow for multiline input
        onChanged: onChanged, // Call the onChanged callback when input changes
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove default border
          hintText: "Reply", // Placeholder text
        ),
      ),
    );
  }

  // Builds the send button
  Widget _buildSendButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton.filled(
        onPressed: () {}, // Handle send action
        icon: const Icon(Icons.arrow_upward_rounded),
      ),
    );
  }
}
