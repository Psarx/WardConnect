import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ward_connect/screens/member/user_form.dart';

class AppliedUsersScreen extends StatefulWidget {
  final String sid;

  AppliedUsersScreen({required this.sid});

  @override
  _AppliedUsersScreenState createState() => _AppliedUsersScreenState();
}

class _AppliedUsersScreenState extends State<AppliedUsersScreen> {
  List<dynamic> appliedUsers = [];

  @override
  void initState() {
    super.initState();
    fetchAppliedUsers();
  }

  Future<void> storeApId(String apId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apId', apId);
  }

  Future<void> fetchAppliedUsers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? sid = prefs.getString('schemeId');

      if (sid == null) {
        throw Exception('SID not found in SharedPreferences');
      }
      final response = await http.get(
        Uri.parse('http://localhost:8080/api/auth/applied-users'),
        headers: {'sid': sid},
      );

      if (response.statusCode == 200) {
        setState(() {
          appliedUsers = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load applied users');
      }
    } catch (e) {
      print('Error fetching applied users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Users'),
      ),
      body: ListView.builder(
        itemCount: appliedUsers.length,
        itemBuilder: (context, index) {
          final appliedUser = appliedUsers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Applied User: ${appliedUser['nameOfApplicant']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Scheme ID: ${appliedUser['sid']}',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Application status: ${appliedUser['status']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          String apId = appliedUser['usId'];
                          storeApId(apId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ApplicationFormPage()),
                          ); // Store scheme ID in shared preferences
                          // Handle the button press
                          // For example, navigate to a form screen
                        },
                        child: Text('View Form'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
