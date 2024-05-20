import 'package:flutter/material.dart';

class SubjectSection extends StatelessWidget {
  final TextEditingController controller;
  const SubjectSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        maxLines: null,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Subject",
        ),
      ),
    );
  }
}
