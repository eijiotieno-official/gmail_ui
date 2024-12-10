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
        _buildToInputView(), // Build the "To" input section
        if (isToToggled)
          _buildToggleItems(context), // Conditionally show CC and BCC
      ],
    );
  }

  // Builds the "To" input view with the "To" label and toggle button
  Widget _buildToInputView() {
    return InputView(
      controller: toController,
      prefixText: "To",
      keyboardType: TextInputType.emailAddress,
      trailing: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onToToggled, // Toggle CC and BCC input visibility
        child: const Icon(Icons.keyboard_arrow_down_rounded),
      ),
    );
  }

  // Builds the conditional CC and BCC input views
  Widget _buildToggleItems(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomDivider(), // Divider between input sections
        _buildCcInputView(), // Build the "Cc" input view
        CustomDivider(), // Divider between input sections
        _buildBccInputView(), // Build the "Bcc" input view
      ],
    );
  }

  // Builds the "Cc" input view
  Widget _buildCcInputView() {
    return InputView(
      controller: ccController,
      prefixText: "Cc",
      keyboardType: TextInputType.emailAddress,
    );
  }

  // Builds the "Bcc" input view
  Widget _buildBccInputView() {
    return InputView(
      controller: bccController,
      prefixText: "Bcc",
      keyboardType: TextInputType.emailAddress,
    );
  }
}
