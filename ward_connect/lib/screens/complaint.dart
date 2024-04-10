import 'package:flutter/material.dart';

class complaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          // Use Stack to position background image
          children: [
            // Background image (adjust path and BoxFit as needed)
            Image.asset(
              'assets/waves.jpg', // Replace with your image path
              fit: BoxFit.cover, // Adjust (cover, fill, etc.)
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // UI elements placed on top of the background image
                  Text(
                    'Mention Your Complaints',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Write down the complaint',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set button color to blue
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
