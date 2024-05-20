import 'package:flutter/material.dart';

class FromSection extends StatelessWidget {
  final TextEditingController fromController;
  final List<String> senderMails;
  final VoidCallback onPickAccount;
  const FromSection({
    super.key,
    required this.fromController,
    required this.senderMails,
    required this.onPickAccount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPickAccount,
      title: Row(
        children: [
          Text(
            "From    ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: TextField(
              controller: fromController,
              onTap: onPickAccount,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }
}
