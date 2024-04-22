import 'dart:convert';

class User {
  final String id;
  final String name;
  final String username; // Change 'email' to 'username'
  final String password; // Add password field
  final String token;

  User({
    required this.id,
    required this.name,
    required this.username, // Change 'email' to 'username'
    required this.password, // Add password field
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username, // Change 'email' to 'username'
      'password': password, // Add password field
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '', // Change 'email' to 'username'
      password: map['password'] ?? '', // Add password field
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
