import 'account_model.dart';

class Mail {
  final Account from;
  final Account to;
  final List<Account> cc;
  final String subject;
  final String body;
  final bool isRead;
  final bool isStarred;
  final DateTime time;
  Mail({
    required this.from,
    required this.to,
    required this.cc,
    required this.subject,
    required this.body,
    required this.isRead,
    required this.isStarred,
    required this.time,
  });
}
