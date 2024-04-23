import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViewSchemes extends StatefulWidget {
  @override
  _ViewSchemeState createState() => _ViewSchemeState();
}

class _ViewSchemeState extends State<ViewSchemes> {
  List<Map<String, dynamic>> schemes = [];

  @override
  void initState() {
    super.initState();
    fetchSchemes();
  }

  Future<void> fetchSchemes() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('user');

      if (userId == null) {
        throw Exception('User ID not found in SharedPreferences');
      }

      final response = await http.get(
        Uri.parse('http://localhost:8080/api/user/applications'),
        headers: {'user': userId},
      );

      if (response.statusCode == 200) {
        setState(() {
          schemes = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to load schemes');
      }
    } catch (e) {
      print('Error fetching schemes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Applied Schemes'),
      ),
      body: ListView.builder(
        itemCount: schemes.length,
        itemBuilder: (context, index) {
          final scheme = schemes[index];
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
              title: Text('Scheme Id: ${scheme['sid']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Applicant name: ${scheme['nameOfApplicant']}'),
                  Text('Status: ${scheme['status']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
