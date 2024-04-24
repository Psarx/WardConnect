import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ward_connect/screens/user/Status.dart';
import 'package:ward_connect/screens/user/complaint.dart';

import 'package:ward_connect/screens/user/profile.dart';
import 'package:ward_connect/screens/user/Scheme_page.dart';
import 'package:ward_connect/screens/user/certificate_testi.dart';
import 'package:ward_connect/screens/user/login_screen.dart';
import 'package:ward_connect/screens/user/Counsellor_Details.dart';
// Import for carousel
import 'package:ward_connect/screens/user/Status.dart';
import 'package:ward_connect/screens/user/view_cot.dart';
import 'package:ward_connect/screens/user/view_complaints.dart';
import 'package:ward_connect/screens/user/view_schemes.dart';

//import 'package:ward_connect/screens/user/view_cot.dart';
//import 'package:ward_connect/screens/user/view_complaints.dart';

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
  Timer? _timer; // Declare _timer as a class-level variable
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
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void logout() {
    // Implement logout functionality here
    // For example, you can clear user session, remove tokens, etc.
    // After logout, navigate to the sign-in pagec
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
              onPressed:
                  logout, // Call logout method when the button is pressed
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUI()),
                );
              },
            ),
            // Add more ListTile widgets for other drawer items
            // ...
            ListTile(
              title: Text('View Certificates'),
              onTap: () {
                // Handle navigation to Application Status page (replace with your implementation)
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewCertificates()),
                ); // Close drawer
              },
            ),
            ListTile(
              title: Text('Counsellor Details'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counsellor()),
                );
              },
            ),
            ListTile(
              title: Text('View Complaints'),
              onTap: () {
                // Handle navigation to Complaints & Enquiry page (replace with your implementation)
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewComplaint()),
                );
              },
            ),
            ListTile(
              title: Text('View Applied Schemes'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewSchemes()),
                );
              },
            ),
            ListTile(
              title: Text('All Schemes'),
              onTap: () {
                // Handle navigation to Complaints & Enquiry page (replace with your implementation)
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchemeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchemeScreen()),
                          );
                          // Handle navigation to Scheme 1
                        },
                        child: Text(
                          'Apply for Schemes',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplaintScreen()),
                          );
                          // Handle navigation to Scheme 2
                        },
                        child: Text(
                          'Register Complaint',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CertificateOfTestimony()),
                          );
                          // Handle navigation to Scheme 3
                        },
                        child: Text(
                          'Apply for Certificate of Testimony',
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

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your sign-in page UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Text('Sign In Page'),
      ),
    );
  }
}
