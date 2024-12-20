import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';

import '../base/account_model.dart';
import '../base/mail_model.dart';
import 'account_repository.dart';

final Random _random = Random();
final AccountRepository _accountRepository = AccountRepository();

class MailRepository {
  List<Mail> fetch() {
    final accounts = _accountRepository.accounts;
    final currentUser = _accountRepository.currentUser;

    return List.generate(accounts.length, (index) {
      final account = accounts[index];
      final isEven = index.isEven;

      // Generate CC list
      final cc = _generateCc(accounts, isEven);

      // Generate email content
      final subject = lorem(paragraphs: 1, words: 50);
      final body = lorem(paragraphs: 5, words: 125);

      // Generate timestamp
      final time = _generateTime();

      // Create Mail object
      return Mail(
        from: account,
        to: currentUser,
        cc: cc,
        subject: subject,
        body: body,
        time: time,
        isRead: index % 4 == 0,
        isStarred: !isEven,
      );
    });
  }

  // Helper method to generate CC list
  List<Account> _generateCc(List<Account> accounts, bool isEven) {
    if (!isEven) return [];
    return [accounts[_random.nextInt(accounts.length)]];
  }

  // Helper method to generate the timestamp
  // Helper method to generate a random timestamp
  DateTime _generateTime() {
    final now = DateTime.now();

    // Generate a random offset for days, hours, minutes, and seconds
    final randomDays = _random.nextInt(30); // Up to 30 days ago
    final randomHours = _random.nextInt(24); // Up to 24 hours in the day
    final randomMinutes = _random.nextInt(60); // Up to 60 minutes
    final randomSeconds = _random.nextInt(60); // Up to 60 seconds

    return now.subtract(Duration(
      days: randomDays,
      hours: randomHours,
      minutes: randomMinutes,
      seconds: randomSeconds,
    ));
  }
}
