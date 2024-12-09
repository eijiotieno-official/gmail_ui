import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ComposeAppBar extends StatelessWidget {
  const ComposeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.sizeOf(context));

    return AppBar(
      leading: IconButton(
        icon: Icon(screenType == DeviceScreenType.mobile
            ? Icons.arrow_back_rounded
            : Icons.close_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        if (screenType == DeviceScreenType.mobile) _actionButtons(),
      ],
    );
  }

  Widget _actionButtons() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.attach_file_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send_rounded,
            ),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Schedule send"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Add from Contacts"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Confidential mode"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Save draft"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Discard"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Settings"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Help and feedback"),
                ),
              ];
            },
          ),
        ],
      );
}
