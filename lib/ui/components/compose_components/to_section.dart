import 'package:flutter/material.dart';

class ToSection extends StatelessWidget {
  final TextEditingController toController;

  final TextEditingController ccController;

  final TextEditingController bccController;

  final bool isToToggled;

  final VoidCallback onToToggled;

  final Color prefixColor;

  const ToSection({
    super.key,
    required this.toController,
    required this.ccController,
    required this.bccController,
    required this.isToToggled,
    required this.onToToggled,
    required this.prefixColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTextInput(
          prefixText: "To",
          textEditingController: toController,
          isTo: true && isToToggled == false,
        ),
        if (isToToggled) _buildToggleItems(),
      ],
    );
  }

  Widget _buildToggleItems() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          _buildTextInput(
            prefixText: "Cc",
            textEditingController: ccController,
            isTo: false,
          ),
          const Divider(),
          _buildTextInput(
            prefixText: "Bcc",
            textEditingController: bccController,
            isTo: false,
          ),
        ],
      );

  Widget _buildTextInput({
    required String prefixText,
    required TextEditingController textEditingController,
    required bool isTo,
  }) =>
      ListTile(
        onTap: onToToggled,
        title: Row(
          children: [
            Text(
              "$prefixText    ",
              style: TextStyle(color: prefixColor),
            ),
            Expanded(
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
        trailing: isTo ? const Icon(Icons.keyboard_arrow_down_rounded) : null,
      );
}
