
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Image.asset(
            "assets/waves.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content on top of background image
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Home Button
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Implement the action you want when home button is pressed
                  },
                ),
                // Text "My Profile"
                Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),

                // Profile image
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/profile-pic.png"),
                ),
                SizedBox(height: 20.0),

                // Text fields for user information
                TextField(
                  decoration: InputDecoration(
                    labelText: "User ID",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Age",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ration ID",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ration Type",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Aadhaar No",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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



                   
