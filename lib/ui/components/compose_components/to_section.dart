import 'package:flutter/material.dart';

class ToSection extends StatefulWidget {
  final TextEditingController toController;

  final TextEditingController ccController;

  final TextEditingController bccController;

  const ToSection(
      {super.key,
      required this.toController,
      required this.ccController,
      required this.bccController});

  @override
  State<ToSection> createState() => _ToSectionState();
}

class _ToSectionState extends State<ToSection> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTextInput(
          prefixText: "To",
          textEditingController: widget.toController,
          isTo: true && _isToggled == false,
        ),
        if (_isToggled) _buildToggleItems(),
      ],
    );
  }

  Widget _buildToggleItems() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          _buildTextInput(
            prefixText: "Cc",
            textEditingController: widget.ccController,
            isTo: false,
          ),
          const Divider(),
          _buildTextInput(
            prefixText: "Bcc",
            textEditingController: widget.bccController,
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
        onTap: () {
          if (isTo) {
            setState(() {
              _isToggled = true;
            });
          }
        },
        title: Row(
          children: [
            Text(
              "$prefixText    ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: TextField(
                controller: textEditingController,
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
