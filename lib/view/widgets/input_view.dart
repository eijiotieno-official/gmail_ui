import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final String? prefixText;
  final Widget? trailing;
  const InputView({
    super.key,
    this.onTap,
    this.prefixText,
    this.trailing,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        hoverColor: Theme.of(context).colorScheme.surface,
        focusColor: Theme.of(context).colorScheme.surface,
        splashColor: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            if (prefixText != null)
              Text(
                "$prefixText  ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
