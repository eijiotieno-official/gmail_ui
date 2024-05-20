import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/components/mail_item.dart';
import 'package:provider/provider.dart';

class MailList extends StatelessWidget {
  final List<Mail> mails;
  const MailList({super.key, required this.mails});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenTypeNotifier>(
      builder: (context, ref, child) {
        return Expanded(
          child: Card(
            elevation: ref.screenType == ScreenType.mobile ? 0.0 : 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListView.builder(
              itemCount: mails.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return MailItem(
                  mail: mails[index],
                  isMobile: ref.screenType == ScreenType.mobile,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
