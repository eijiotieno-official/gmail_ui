import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmail_ui/model/base/mail_model.dart';
import 'package:gmail_ui/view/widgets/detail_app_bar_view.dart';
import 'package:gmail_ui/view/widgets/mail_input_view.dart';
import 'package:gmail_ui/view_model/mail_view_model.dart';

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
    final mail = ref.watch(openedMailProvider);

    return Material(
      child: mail == null
          ? SizedBox.shrink()
          : Column(
              children: [
                DetailAppBar(),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          mail.subject,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
                        ),
                      ),
                      _buildSender(mail),
                      ListTile(
                        title: Text(
                          mail.body,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
                      ),
                      Spacer(),
                      MailInput(
                        controller: _mailController,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSender(Mail mail) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person_2_rounded),
      ),
      title: Text(mail.from.name),
      subtitle: Text("to me"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${DateTimeService.day(mail.time)} ${DateTimeService.time(
              dateTime: mail.time,
              context: context,
            )}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: mail.isRead ? null : FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_outline_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.reply_outlined,
            ),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Reply"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Forward"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Filter message like this"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Translate"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Print"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Mark unread from here"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Text("Block ${mail.from.name}"),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
