import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViewCertificates extends StatefulWidget {
  @override
  _ViewCertificateState createState() => _ViewCertificateState();
}

class _ViewCertificateState extends State<ViewCertificates> {
  List<Map<String, dynamic>> certificates = [];

  @override
  void initState() {
    super.initState();
    fetchCertificates();
  }

  Future<void> fetchCertificates() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('user');

      if (userId == null) {
        throw Exception('User ID not found in SharedPreferences');
      }

      final response = await http.get(
        Uri.parse('http://localhost:8080/api/user/certificates'),
        headers: {'user': userId},
      );

      if (response.statusCode == 200) {
        setState(() {
          certificates =
              List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to load certificatess');
      }
    } catch (e) {
      print('Error fetching certificates: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Certificates'),
      ),
      body: ListView.builder(
        itemCount: certificates.length,
        itemBuilder: (context, index) {
          final certificate = certificates[index];
          return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text('userId: ${certificate['usId']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Applied username: ${certificate['appliname']}'),
                    Text('Phone: ${certificate['phone']}'),
                    Text('Details: ${certificate['details']}'),
                    Text('State: ${certificate['state']}'),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
