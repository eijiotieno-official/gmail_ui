import 'package:flutter/material.dart';

class ToSection extends StatefulWidget {
  const ToSection({super.key});

  @override
  State<ToSection> createState() => _ToSectionState();
}

class _ToSectionState extends State<ToSection> {
  final TextEditingController _toController = TextEditingController();

  final TextEditingController _ccController = TextEditingController();

  final TextEditingController _bccController = TextEditingController();

  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTextInput(
          prefixText: "To",
          textEditingController: _toController,
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
            textEditingController: _ccController,
            isTo: false,
          ),
          const Divider(),
          _buildTextInput(
            prefixText: "Bcc",
            textEditingController: _bccController,
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
