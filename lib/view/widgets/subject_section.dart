import 'package:flutter/material.dart';

class SubjectSection extends StatelessWidget {
  final TextEditingController controller;
  const SubjectSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        maxLines: null,
        controller: controller,
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: "Subject",
          hintStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
