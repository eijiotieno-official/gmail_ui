import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'attachment.dart';

class Mail {
  final String id;
  final String sender;
  final String subject;
  final String body;
  final bool isRead;
  final bool isStarred;
  final List<String> recipients;
  final DateTime timestamp;
  final List<Attachment> attachments;
  Mail({
    required this.id,
    required this.sender,
    required this.subject,
    required this.body,
    required this.isRead,
    required this.isStarred,
    required this.recipients,
    required this.timestamp,
    required this.attachments,
  });

  Mail copyWith({
    String? id,
    String? sender,
    String? subject,
    String? body,
    bool? isRead,
    bool? isStarred,
    List<String>? recipients,
    DateTime? timestamp,
    List<Attachment>? attachments,
  }) {
    return Mail(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      subject: subject ?? this.subject,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      isStarred: isStarred ?? this.isStarred,
      recipients: recipients ?? this.recipients,
      timestamp: timestamp ?? this.timestamp,
      attachments: attachments ?? this.attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'subject': subject,
      'body': body,
      'isRead': isRead,
      'isStarred': isStarred,
      'recipients': recipients,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'attachments': attachments.map((x) => x.toMap()).toList(),
    };
  }

  factory Mail.fromMap(Map<String, dynamic> map) {
    return Mail(
      id: map['id'] ?? '',
      sender: map['sender'] ?? '',
      subject: map['subject'] ?? '',
      body: map['body'] ?? '',
      isRead: map['isRead'] ?? false,
      isStarred: map['isStarred'] ?? false,
      recipients: List<String>.from(map['recipients']),
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      attachments: List<Attachment>.from(map['attachments']?.map((x) => Attachment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mail.fromJson(String source) => Mail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mail(id: $id, sender: $sender, subject: $subject, body: $body, isRead: $isRead, isStarred: $isStarred, recipients: $recipients, timestamp: $timestamp, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Mail &&
      other.id == id &&
      other.sender == sender &&
      other.subject == subject &&
      other.body == body &&
      other.isRead == isRead &&
      other.isStarred == isStarred &&
      listEquals(other.recipients, recipients) &&
      other.timestamp == timestamp &&
      listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sender.hashCode ^
      subject.hashCode ^
      body.hashCode ^
      isRead.hashCode ^
      isStarred.hashCode ^
      recipients.hashCode ^
      timestamp.hashCode ^
      attachments.hashCode;
  }
}
