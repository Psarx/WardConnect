import 'dart:convert';

class Complaints {
  final String name;
  final String phone;
  final String complaint;

  Complaints({
    required this.name,
    required this.phone,
    required this.complaint,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'complaint': complaint,
    };
  }

  factory Complaints.fromMap(Map<String, dynamic> map) {
    return Complaints(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      complaint: map['complaint'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Complaints.fromJson(String source) =>
      Complaints.fromMap(json.decode(source));
}
