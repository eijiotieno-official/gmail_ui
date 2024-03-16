import 'package:flutter/material.dart';
import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/utils/formatted_time.dart';

class MailItem extends StatelessWidget {
  final Mail mail;
  const MailItem({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).hoverColor,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: const CircleAvatar(),
          isThreeLine: true,
          title: Text(mail.sender),
          subtitle: Text.rich(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: mail.subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: " - ${mail.body}"),
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
