import 'dart:convert';

class Scheme {
  final String sid;
  final String sdetails;
  final String stype;

  Scheme({
    required this.sid,
    required this.sdetails,
    required this.stype,
  });

  factory Scheme.fromJson(Map<String, dynamic> json) {
    return Scheme(
      sid: json['sid'],
      sdetails: json['sdetails'],
      stype: json['stype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sid': sid,
      'sdetails': sdetails,
      'stype': stype,
    };
  }
}
