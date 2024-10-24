import 'dart:convert';

class Password {
  String name;
  String username;
  String password;
  String url;
  String? faviconUrl;

  Password({
    required this.name,
    required this.username,
    required this.password,
    required this.url,
    this.faviconUrl,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());

  factory Password.fromMap(Map<String, String> map) {
    return Password(
      name: map['name']!,
      username: map['username']!,
      password: map['password']!,
      url: map['url']!,
      faviconUrl: map['faviconUrl'],
    );
  }

  factory Password.fromJson(String source) => Password.fromMap(json.decode(source));
}
