import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package
import 'package:ward_connect/screens/user/home_screen.dart';
import 'package:ward_connect/screens/user/application.dart';
import 'package:ward_connect/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SchemeScreen extends StatefulWidget {
  @override
  _SchemeScreenState createState() => _SchemeScreenState();
}

class _SchemeScreenState extends State<SchemeScreen> {
  AuthService authService = AuthService();
  List<dynamic>? schemesOfType1;
  List<dynamic>? schemesOfType2;

  @override
  void initState() {
    super.initState();
    fetchSchemes();
  }

  void fetchSchemes() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/api/auth/schemes'));
      if (response.statusCode == 200) {
        Map<String, dynamic> schemeData = json.decode(response.body);
        setState(() {
          schemesOfType1 = schemeData['schemesOfType1'];
          schemesOfType2 = schemeData['schemesOfType2'];
        });
      } else {
        throw Exception('Failed to load schemes');
      }
    } catch (e) {
      print('Error fetching schemes: $e');
    }
  }

  // Function to store scheme ID in shared preferences
  Future<void> storeSchemeId(String schemeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('schemeId', schemeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Schemes'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (schemesOfType1 != null && schemesOfType1!.isNotEmpty)
              _buildSchemeList('Block Panchayath Schemes', schemesOfType1!),
            if (schemesOfType2 != null && schemesOfType2!.isNotEmpty)
              _buildSchemeList('District Council Schemes', schemesOfType2!),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeList(String title, List<dynamic> schemes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: schemes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Scheme ID: ${schemes[index]['sid'] ?? ''}'),
              subtitle: Text(schemes[index]['sdetails'] ?? ''),
              trailing: ElevatedButton(
                onPressed: () {
                  String schemeId = schemes[index]['sid'];
                  storeSchemeId(
                      schemeId); // Store scheme ID in shared preferences
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppForm()),
                  );
                },
                child: Text('Apply'),
              ),
            );
          },
        ),
      ],
    );
  }
}
