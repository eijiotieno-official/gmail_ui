import 'package:gmail_ui/data/models/attachment.dart';

List<Attachment> generateAttachments(int numberOfAttachments) {
  List<Attachment> availableAttachments = [];
  List<Attachment> generatedAttachments = [];

  if (numberOfAttachments > availableAttachments.length) {
    throw ArgumentError(
        "Number of requested attachments exceeds available attachments");
  }

  for (int i = 1; i <= numberOfAttachments; i++) {
    Attachment attachment = Attachment(
      name: availableAttachments[i].name,
      url: availableAttachments[i].url,
    );
    generatedAttachments.add(attachment);
  }

  return generatedAttachments;
}
