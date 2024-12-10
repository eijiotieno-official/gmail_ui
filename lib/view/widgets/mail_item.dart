import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../model/base/mail_model.dart';
import '../../model/services/date_time_services.dart';
import '../../view_model/mail_view_model.dart';
import '../pages/mail_detail_page.dart';
import 'account_view.dart';

class MailItem extends ConsumerWidget {
  final Mail mail;
  final bool isLast;
  final bool isFirst;

  const MailItem({
    super.key,
    required this.mail,
    required this.isLast,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    // Check if the current mail is the opened mail
    final openedMail = ref.watch(openedMailProvider);
    bool isOpened = openedMail == mail;

    // Conditional decoration for borders based on screen type
    BoxDecoration decoration = BoxDecoration(
      border: screenType == DeviceScreenType.mobile
          ? null
          : Border(
              bottom: BorderSide(
                color: Theme.of(context).hoverColor,
              ),
            ),
    );

    // Conditional padding for the ListTile based on whether it's opened
    final tileColor =
        isOpened ? Theme.of(context).colorScheme.primaryContainer : null;

    TextStyle getTextStyle(bool isRead) {
      return TextStyle(
        fontWeight: isRead ? null : FontWeight.bold, // Bold if unread
      );
    }

    return DecoratedBox(
      decoration: decoration,
      child: ListTile(
        tileColor: tileColor,
        onTap: () {
          ref.read(openedMailProvider.notifier).state = mail;

          // Navigate to the MailDetailPage for mobile/tablet devices
          if (screenType == DeviceScreenType.mobile ||
              screenType == DeviceScreenType.tablet) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MailDetailPage(),
              ),
            );
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: isLast ? const Radius.circular(16.0) : Radius.zero,
            bottomRight: isLast ? const Radius.circular(16.0) : Radius.zero,
            topLeft: isFirst ? const Radius.circular(16.0) : Radius.zero,
            topRight: isFirst ? const Radius.circular(16.0) : Radius.zero,
          ),
        ),
        leading: AccountProfileView(account: mail.from),
        title: Row(
          children: [
            // Display mail sender's name, with bold text if unread
            Expanded(
              child: Text(
                mail.from.name,
                style: TextStyle(
                  fontWeight: mail.isRead ? null : FontWeight.bold,
                ),
              ),
            ),
            // Display date and time for unread mails
            if (!mail.isRead)
              Text(
                "${DateTimeService.day(mail.time)} ${DateTimeService.time(dateTime: mail.time, context: context)}",
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
              // Display subject
              TextSpan(
                text: mail.subject,
                style: getTextStyle(mail.isRead),
              ),
              // Display body
              TextSpan(
                text: " - ${mail.body}",
                style: getTextStyle(mail.isRead),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
