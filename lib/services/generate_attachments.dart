import 'package:gmail_ui/data/models/attachment.dart';

List<Attachment> generateAttachments(int numberOfAttachments) {
  List<Attachment> attachments = [];

  for (int i = 1; i <= numberOfAttachments; i++) {
    attachments.add(Attachment(
      name: 'Attachment$i',
      url: 'url$i',
    ));
  }

  return attachments;
}
