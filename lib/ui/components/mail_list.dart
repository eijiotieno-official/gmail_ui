import 'package:flutter/material.dart';
import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/ui/components/mail_item.dart';

class MailList extends StatelessWidget {
  final List<Mail> mails;
  const MailList({super.key, required this.mails});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        
        child: ListView.builder(
          itemCount: mails.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return MailItem(mail: mails[index]);
          },
        ),
      ),
    );
  }
}
