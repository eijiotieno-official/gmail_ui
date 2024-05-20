import 'dart:math';

String generateSender() {
  List<String> senderPatterns = [
    'John Smith',
    'Jane Doe',
    'Alice Johnson',
    'Bob Brown',
    'Carol Williams',
    'Dave Miller',
    'Eve Davis',
    'Frank Wilson',
    'Grace Moore',
    'Heidi Taylor',
    'Ivan Anderson',
    'Judy Thomas',
    'Mallory Jackson',
    'Niaj White',
    'Olivia Harris',
    'Peggy Martin',
    'Sybil Thompson',
    'Trent Garcia',
    'Victor Martinez',
  ];

  Random random = Random();

  int index = random.nextInt(senderPatterns.length);

  return senderPatterns[index];
}
