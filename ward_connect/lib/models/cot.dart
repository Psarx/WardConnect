import 'dart:convert';

class CertificateofTestimony {
  final String appliname;
  final String phone;
  final String details;

  CertificateofTestimony({
    required this.appliname,
    required this.phone,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'appliname': appliname,
      'phone': phone,
      'details': details,
    };
  }

  factory CertificateofTestimony.fromMap(Map<String, dynamic> map) {
    return CertificateofTestimony(
      appliname: map['appliname'] ?? '',
      phone: map['phone'] ?? '',
      details: map['details'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CertificateofTestimony.fromJson(String source) =>
      CertificateofTestimony.fromMap(json.decode(source));
}
