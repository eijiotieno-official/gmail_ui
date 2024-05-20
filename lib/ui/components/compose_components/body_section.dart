import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  final TextEditingController controller;
  const BodySection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        maxLines: null,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Compose email",
        ),
      ),
    );
  }
}
