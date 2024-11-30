import 'package:flutter/material.dart';
import 'package:gmail_ui/model/base/mail_model.dart';
import 'package:gmail_ui/model/services/date_time_services.dart';
import 'package:gmail_ui/view/widgets/account_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MailItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: screenType == DeviceScreenType.mobile
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(context).hoverColor,
                ),
              ),
      ),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: isLast ? Radius.circular(16.0) : Radius.zero,
            bottomRight: isLast ? Radius.circular(16.0) : Radius.zero,
            topLeft: isFirst ? Radius.circular(16.0) : Radius.zero,
            topRight: isFirst ? Radius.circular(16.0) : Radius.zero,
          ),
        ),
        leading: AccountProfileView(account: mail.from),
        title: Row(
          children: [
            Expanded(
              child: Text(
                mail.from.name,
                style: TextStyle(
                  fontWeight: mail.isRead ? null : FontWeight.bold,
                ),
              ),
            ),
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
              //       formattedTime(dateTime: mail.time, context: context),
              //   style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
