import 'package:gmail_ui/data/models/mail.dart';
import 'package:gmail_ui/services/generate_body.dart';
import 'package:gmail_ui/services/generate_recipients.dart';
import 'package:gmail_ui/services/generate_sender.dart';
import 'package:gmail_ui/services/generate_subjects.dart';

class MailDatabase {
  static Future<List<Mail>> getAll(int numberOfMails) async {
    List<Mail> result = [];

    for (int i = 1; i <= numberOfMails; i++) {
      Mail mail = Mail(
        id: i.toString(),
        sender: generateSender(),
        subject: generateSubject(),
        body: generateBody(7),
        recipients: generateRecipients(i),
        timestamp: DateTime.now().subtract(Duration(days: i)),
        attachments: [],
        isRead: (i % 3) != 0,
        isStarred: (i % 3) == 0,
      );
      result.add(mail);
    }

    return result;
  }
}
