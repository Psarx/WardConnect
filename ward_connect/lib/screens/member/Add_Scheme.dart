import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package

class SchemeDetailsPage extends StatefulWidget {
  @override
  _SchemeDetailsPageState createState() => _SchemeDetailsPageState();
}

class _SchemeDetailsPageState extends State<SchemeDetailsPage> {
  final TextEditingController sidController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  Future<void> submitSchemeDetails() async {
    // Create a map representing the scheme data
    final Map<String, String> schemeData = {
      'sid': sidController.text,
      'sdetails': detailsController.text,
      'stype': typeController.text,
    };

    try {
      // Send a POST request to the backend API endpoint
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/auth/schemes/add'),
        body: jsonEncode(schemeData), // Encode the scheme data as JSON
        headers: <String, String>{
          'Content-Type': 'application/json', // Set the request headers
        },
      );

      // Check the response status code
      if (response.statusCode == 201) {
        // Clear text fields after successful submission
        sidController.clear();
        detailsController.clear();
        typeController.clear();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Scheme submitted successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle errors if the request fails
        throw Exception('Failed to submit scheme: ${response.body}');
      }
    } catch (error) {
      // Handle network errors or other exceptions
      print('Error submitting scheme: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting scheme. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Schemes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: sidController,
              decoration: InputDecoration(labelText: 'Scheme ID'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: detailsController,
              decoration: InputDecoration(labelText: 'Scheme Details'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Scheme Type'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                submitSchemeDetails();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
