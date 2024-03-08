import 'attachment.dart';

class Mail {
  String id;
  String sender;
  String subject;
  String body;
  List<String> recipients;
  DateTime timestamp;
  List<Attachment> attachments;

  Mail({
    required this.id,
    required this.sender,
    required this.subject,
    required this.body,
    required this.recipients,
    required this.timestamp,
    required this.attachments,
  });

  factory Mail.fromJson(Map<String, dynamic> json) {
    List<dynamic> attachmentsJson = json['attachments'];
    List<Attachment> parsedAttachments = attachmentsJson
        .map((attachmentJson) => Attachment.fromJson(attachmentJson))
        .toList();

    return Mail(
      id: json['id'],
      sender: json['sender'],
      subject: json['subject'],
      body: json['body'],
      recipients: List<String>.from(json['recipients']),
      timestamp: DateTime.parse(json['timestamp']),
      attachments: parsedAttachments,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> attachmentsJson =
        attachments.map((attachment) => attachment.toJson()).toList();

    return {
      'id': id,
      'sender': sender,
      'subject': subject,
      'body': body,
      'recipients': recipients,
      'timestamp': timestamp.toIso8601String(),
      'attachments': attachmentsJson,
    };
  }
}
