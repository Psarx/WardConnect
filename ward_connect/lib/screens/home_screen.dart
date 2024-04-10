import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ward_connect/screens/certificate_testi.dart'; // Import for carousel

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentImageIndex = 0;
  final List<String> _imageUrls = [
    'news.jpeg', // Replace with your image paths
    'news.jpeg',
    'news.jpeg',
    'news.jpeg',
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent, // Ensure background image visibility

      appBar: AppBar(
        backgroundColor: Colors.blue, // Change the color of the task bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'e-WARD',
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                // Handle logout button press
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Welcome User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                // Handle navigation to My Profile page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Application Status'),
              onTap: () {
                // Handle navigation to Application Status page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Counsellor Details'),
              onTap: () {
                // Handle navigation to Counsellor Details page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Complaints & Enquiry'),
              onTap: () {
                // Handle navigation to Complaints & Enquiry page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Testimony Certificate'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CertificateOfTestimony()),
                );
              },
            ),
            ListTile(
              title: Text('All Schemes'),
              onTap: () {
                // Handle navigation to Complaints & Enquiry page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Handle navigation to Complaints & Enquiry page (replace with your implementation)
                Navigator.pop(context); // Close drawer
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/rm222batch5-mind-25.jpg', // Change to your background image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // Change to Row for horizontal arrangement
              children: [
                // Carousel (full width)
                Container(
                  width: double.infinity, // Stretch to full width
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CarouselSlider(
                      items: _imageUrls.map((imageUrl) {
                        return Image.asset(
                          'assets/$imageUrl', // Adjust path based on image location
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(
                            seconds: 2), // Change image every 2 seconds
                        aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),

                // Scrollable list of schemes
                Expanded(
                  child: ListView(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle navigation to Scheme 1
                        },
                        child: Text(
                          'Scheme 1',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle navigation to Scheme 2
                        },
                        child: Text(
                          'Scheme 2',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle navigation to Scheme 3
                        },
                        child: Text(
                          'Scheme 3',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      // Add more buttons for other schemes
                    ],
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
//