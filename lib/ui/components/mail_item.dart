import 'package:flutter/material.dart';
import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/ui/components/gmail_profile.dart';
import 'package:gmail_ui/utils/date_time_utils.dart';

class MailItem extends StatelessWidget {
  final Mail mail;
  final bool isMobile;
  const MailItem({super.key, required this.mail, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: isMobile
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(context).hoverColor,
                ),
              ),
      ),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: const GmailProfile(),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  mail.sender,
                  style: TextStyle(
                    fontWeight: mail.isRead ? null : FontWeight.bold,
                  ),
                ),
              ),
              if (!mail.isRead)
                Text(
                  "${DateTimeUtils.day(mail.timestamp)} ${DateTimeUtils.time(dateTime: mail.timestamp, context: context)}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    fontWeight: mail.isRead ? null : FontWeight.bold,
                  ),
                ),
            ],
          ),
          subtitle: Text.rich(
            maxLines: mail.isRead ? 1 : 2,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: mail.subject,
                  style: TextStyle(
                    fontWeight: mail.isRead ? null : FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " - ${mail.body}",
                  style: TextStyle(
                    fontWeight: mail.isRead ? null : FontWeight.bold,
                  ),
                ),
                // TextSpan(
                //   text:
                //       formattedTime(dateTime: mail.timestamp, context: context),
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
