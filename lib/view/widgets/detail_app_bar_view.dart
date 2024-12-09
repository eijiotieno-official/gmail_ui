import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/mail_view_model.dart';

class DetailAppBar extends ConsumerWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.sizeOf(context));

    return Padding(
      padding: EdgeInsets.only(
          top: screenType == DeviceScreenType.desktop ? 16.0 : 0.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            ref.read(openedMailProvider.notifier).state = null;

            if (screenType == DeviceScreenType.mobile ||
                screenType == DeviceScreenType.tablet) {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          _actionButtons(),
        ],
      ),
    );
  }

  Widget _actionButtons() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mark_email_unread_outlined,
            ),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Move to"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Snooze"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Change labels"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Mark as important"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Mute"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Print all"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Report spam"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Add to tasks"),
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
