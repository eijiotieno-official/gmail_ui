import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/services/generate_attachments.dart';
import 'package:gmail_ui/services/generate_body.dart';
import 'package:gmail_ui/services/generate_recipients.dart';
import 'package:gmail_ui/services/generate_subjects.dart';

class MailDatabase {
  static List<Mail> data = [];

  static Future<void> getAll(int numberOfMails) async {
    data.clear();

    for (int i = 1; i <= numberOfMails; i++) {
      Mail mail = Mail(
        id: i.toString(),
        sender: 'me@example.com',
        subject: generateSubject(1),
        body: generateBody(3),
        recipients: generateRecipients(i),
        timestamp: DateTime.now().subtract(Duration(days: i)),
        attachments: generateAttachments(2),
      );
      data.add(mail);
    }
  }
}
