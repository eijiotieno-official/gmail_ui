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
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file_rounded),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                onChanged: onChanged,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Reply"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton.filled(
                onPressed: () {},
                icon: Icon(Icons.arrow_upward_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
