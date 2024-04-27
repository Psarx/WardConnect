import 'dart:ui'; // Import this for AssetImage

import 'package:flutter/material.dart';
import 'package:ward_connect/services/auth_services.dart';
import 'package:ward_connect/screens/user/home_screen.dart';

class CertificateOfTestimony extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  final AuthService authService = AuthService();

  void applyForCertificate(BuildContext context) {
    authService.applyForCertificate(
      context: context,
      appliname: usernameController.text,
      phone: phoneController.text,
      details: reasonController.text,
    );

    // Clear text fields
    usernameController.clear();
    phoneController.clear();
    reasonController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Certificate Of Testimony',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Optional: Change text color
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ); // Add your home icon functionality here
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/waves.jpg'), // Replace 'background_image.jpg' with your actual image file
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY:
                      5), // Optional: Add blur effect to the background image
              child: Container(
                color: Colors.black.withOpacity(
                    0.5), // Optional: Add opacity to the background image
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    fillColor:
                        Colors.white, // Optional: Change text field color
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    fillColor:
                        Colors.white, // Optional: Change text field color
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    labelText: 'Reason for Application',
                    fillColor:
                        Colors.white, // Optional: Change text field color
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    applyForCertificate(context);
                  },
                  child: Text('Apply'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
