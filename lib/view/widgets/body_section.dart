import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  final TextEditingController controller;

  const BodySection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Define the text field decoration
    final inputDecoration = InputDecoration(
      border: InputBorder.none,
      hintText: "Compose email",
      hintStyle: TextStyle(
        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
      ),
    );

    // Return the text field inside a padding container
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        maxLines: null, // Allow unlimited lines of text
        controller: controller,
        decoration: inputDecoration,
      ),
    );
  }
}
