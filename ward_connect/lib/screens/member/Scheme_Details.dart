import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ward_connect/screens/member/Scheme_App.dart';

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

class SchemeInfo extends StatelessWidget {
  final Scheme scheme;

  const SchemeInfo({Key? key, required this.scheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Scheme Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scheme ID: ${scheme.sid}'),
            SizedBox(height: 8),
            Text('Scheme Type: ${scheme.stype}'),
            SizedBox(height: 8),
            Text('Scheme Details: ${scheme.sdetails}'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showApprovalDialog(context);
                  },
                  child: Text('Approve'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showRejectionDialog(context);
                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showApprovalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Application Approved'),
          content: Text('The application has been approved.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchemeApp()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showRejectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Application Rejected'),
          content: Text('The application has been rejected.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchemeApp()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// Example usage:
// Scheme scheme = Scheme(sid: '1', sdetails: 'Details', stype: 'Type');
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => SchemeDetailsPage(scheme: scheme)),
// );
