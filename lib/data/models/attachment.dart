import 'dart:convert';

class Attachment {
  String name;
  String url;
  Attachment({
    required this.name,
    required this.url,
  });

  

  Attachment copyWith({
    String? name,
    String? url,
  }) {
    return Attachment(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Attachment.fromMap(Map<String, dynamic> map) {
    return Attachment(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Attachment.fromJson(String source) => Attachment.fromMap(json.decode(source));

  @override
  String toString() => 'Attachment(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Attachment &&
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
