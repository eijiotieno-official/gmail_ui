import 'package:flutter/material.dart';

class SubjectSection extends StatelessWidget {
  final TextEditingController controller;

  const SubjectSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _buildSubjectTextField(context),
    );
  }

  // Builds the TextField for the subject input
  Widget _buildSubjectTextField(BuildContext context) {
    return TextField(
      maxLines: null, // Allow multiple lines if needed
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none, // No border
        hintText: "Subject", // Placeholder text
        hintStyle: TextStyle(
          color: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.color
              ?.withOpacity(0.5), // Faded hint text color
        ),
      ),
    );
  }
}
