import 'package:flutter/material.dart';
import 'package:ward_connect/services/auth_services.dart'; // Import your database service
import 'package:ward_connect/models/scheme.dart'; // Import your Scheme model

class SchemeDetailsPage extends StatefulWidget {
  @override
  _SchemeDetailsPageState createState() => _SchemeDetailsPageState();
}

class _SchemeDetailsPageState extends State<SchemeDetailsPage> {
  final TextEditingController sidController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  //final DatabaseService databaseService = DatabaseService();

  void submitSchemeDetails() {
    // Create a Scheme object with the entered data
    Scheme scheme = Scheme(
      sid: sidController.text,
      sdetails: detailsController.text,
      stype: 'YourDefaultType', // You may change this as per your requirements
    );

    // Save the Scheme object to the database
    //databaseService.saveScheme(scheme);

    // Clear text fields after submission
    sidController.clear();
    detailsController.clear();
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
