List<String> generateRecipients(int numberOfRecipients) {
  if (numberOfRecipients <= 0) {
    throw ArgumentError("Number of recipients should be greater than 0");
  }

  List<String> recipients = [];

  for (int i = 1; i <= numberOfRecipients; i++) {
    recipients.add('recipient$i@example.com');
  }

  return recipients;
}
