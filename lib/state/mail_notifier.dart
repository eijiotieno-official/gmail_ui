import 'package:flutter/material.dart';
import 'package:gmail_ui/data/databases/mail_database.dart';
import 'package:gmail_ui/data/models/mail.dart';

class MailNotifier extends ChangeNotifier {
  List<Mail> _mails = [];

  List<Mail> get mails => _mails;

  Future<void> loadMails() async {
    _mails = await MailDatabase.getAll(20);
    notifyListeners();
  }
}
