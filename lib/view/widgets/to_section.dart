import 'package:flutter/material.dart';
import 'custom_divider.dart';
import 'input_view.dart';

class ToSection extends StatelessWidget {
  final TextEditingController toController;

  final TextEditingController ccController;

  final TextEditingController bccController;

  final bool isToToggled;

  final VoidCallback onToToggled;

  const ToSection({
    super.key,
    required this.toController,
    required this.ccController,
    required this.bccController,
    required this.isToToggled,
    required this.onToToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputView(
          controller: toController,
          prefixText: "To",
          keyboardType: TextInputType.emailAddress,
          trailing: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {
              onToToggled();
            },
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
          ),
        ),
        if (isToToggled) _buildToggleItems(context),
      ],
    );
  }

  Widget _buildToggleItems(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDivider(),
          InputView(
            controller: ccController,
            prefixText: "Cc",
            keyboardType: TextInputType.emailAddress,
          ),
          CustomDivider(),
          InputView(
            controller: bccController,
            prefixText: "Bcc",
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      );
}
