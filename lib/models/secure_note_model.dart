import 'dart:convert';
class SecureNote {
  final String title;
  final String content;

  SecureNote({
    required this.title,
    required this.content,
  });

  Map<String, String> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  String toJson() => json.encode(toMap());

  factory SecureNote.fromMap(Map<String, String> map) {
    return SecureNote(
      title: map['title']!,
      content: map['content']!,
    );
  }

  factory SecureNote.fromJson(String source) =>
      SecureNote.fromMap(json.decode(source));

}

