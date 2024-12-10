import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/base/mail_model.dart';
import '../widgets/detail_app_bar_view.dart';
import '../widgets/mail_input_view.dart';
import '../../view_model/mail_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../model/services/date_time_services.dart';

class MailDetailPage extends ConsumerStatefulWidget {
  const MailDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MailDetailPageState();
}

class _MailDetailPageState extends ConsumerState<MailDetailPage> {
  final TextEditingController _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mail = ref.watch(openedMailProvider); // Watch the selected mail

    // Determine device screen type for responsive layout
    DeviceScreenType deviceScreenType =
        getDeviceType(MediaQuery.sizeOf(context));

    // Return the layout based on whether there's a mail or not
    return Material(
      child: mail == null
          ? SizedBox.shrink() // Empty view if no mail is available
          : Column(
              children: [
                // App bar section for mail details
                const DetailAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Display mail subject
                        _buildMailSubject(mail),
                        // Display sender information
                        _buildSender(
                            mail: mail, deviceScreenType: deviceScreenType),
                        // Display mail body
                        _buildMailBody(mail),
                      ],
                    ),
                  ),
                ),
                // Mail input section
                MailInput(
                  controller: _mailController,
                  onChanged: (value) {},
                ),
              ],
            ),
    );
  }

  // Build the mail subject
  Widget _buildMailSubject(Mail mail) {
    return ListTile(
      title: Text(
        mail.subject,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
      ),
    );
  }

  // Build the mail body
  Widget _buildMailBody(Mail mail) {
    return ListTile(
      title: Text(
        mail.body,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      ),
    );
  }

  // Build the sender information row
  Widget _buildSender({
    required Mail mail,
    required DeviceScreenType deviceScreenType,
  }) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person_2_rounded)),
      title: Text(
        mail.from.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: const Text(
        "to me",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display time passed since mail received
          Text(
            DateTimeService.timePassed(dateTime: mail.time),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: mail.isRead ? null : FontWeight.bold,
            ),
          ),
          if (deviceScreenType != DeviceScreenType.mobile)
            _buildMailActions(), // Show additional actions for larger screens
        ],
      ),
    );
  }

  // Build additional mail actions like star, reply, etc.
  Widget _buildMailActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_outline_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.emoji_emotions_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.reply_outlined),
        ),
        PopupMenuButton<String>(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          itemBuilder: (context) => _buildPopupMenuItems(),
        ),
      ],
    );
  }

  // Define the items in the popup menu
  List<PopupMenuEntry<String>> _buildPopupMenuItems() {
    return [
      const PopupMenuItem(child: Text("Reply")),
      const PopupMenuItem(child: Text("Forward")),
      const PopupMenuItem(child: Text("Filter message like this")),
      const PopupMenuItem(child: Text("Translate")),
      const PopupMenuItem(child: Text("Print")),
      const PopupMenuItem(child: Text("Mark unread from here")),
      const PopupMenuItem(child: Text("Block sender")),
    ];
  }
}
