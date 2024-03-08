List<String> generateRecipients(int numberOfRecipients) {
  List<String> recipients = [];

  for (int i = 1; i <= numberOfRecipients; i++) {
    recipients.add('recipient$i@example.com');
  }

  return recipients;
}
