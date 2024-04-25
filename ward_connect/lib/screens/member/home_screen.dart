// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ward_connect/screens/user/complaint.dart';

// import 'package:ward_connect/screens/user/profile.dart';
// import 'package:ward_connect/screens/user/Scheme_page.dart';
// import 'package:ward_connect/screens/user/certificate_testi.dart';
// import 'package:ward_connect/screens/user/login_screen.dart';
// import 'package:ward_connect/screens/user/Counsellor_Details.dart'; // Import for carousel

// void main() {
//   runApp(MemberScreen());
// }

// class MemberScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentImageIndex = 0;
//   final List<String> _imageUrls = [
//     'news.jpeg', // Replace with your image paths
//     'news.jpeg',
//     'news.jpeg',
//     'news.jpeg',
//   ];

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       setState(() {
//         _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
//       });
//     });
//   }

//   void logout() {
//     // Implement logout functionality here
//     // For example, you can clear user session, remove tokens, etc.
//     // After logout, navigate to the sign-in page
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.transparent, // Ensure background image visibility

//       appBar: AppBar(
//         backgroundColor: Colors.blue, // Change the color of the task bar
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'e-WARD',
//               style: TextStyle(color: Colors.white),
//             ),
//             TextButton(
//               onPressed:
//                   logout, // Call logout method when the button is pressed
//               child: Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () => scaffoldKey.currentState!.openDrawer(),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Welcome Counsilor',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('My Profile'),
//               onTap: () {
//                 // Handle navigation to My Profile page (replace with your implementation)
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfileUI()),
//                 );
//               },
//             ),
//             // Add more ListTile widgets for other drawer items
//             // ...
//             ListTile(
//               title: Text('Application Status'),
//               onTap: () {
//                 // Handle navigation to Application Status page (replace with your implementation)
//                 Navigator.pop(context); // Close drawer
//               },
//             ),
//             ListTile(
//               title: Text('Counsellor Details'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Counsellor()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('Complaints & Enquiry'),
//               onTap: () {
//                 // Handle navigation to Complaints & Enquiry page (replace with your implementation)
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ComplaintScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('Testimony Certificate'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CertificateOfTestimony()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('All Schemes'),
//               onTap: () {
//                 // Handle navigation to Complaints & Enquiry page (replace with your implementation)
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SchemeScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('Log Out'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/rm222batch5-mind-25.jpg', // Change to your background image path
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               // Change to Row for horizontal arrangement
//               children: [
//                 // Carousel (full width)
//                 Container(
//                   width: double.infinity, // Stretch to full width
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15.0),
//                     child: CarouselSlider(
//                       items: _imageUrls.map((imageUrl) {
//                         return Image.asset(
//                           'assets/$imageUrl', // Adjust path based on image location
//                           fit: BoxFit.cover,
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         autoPlay: true,
//                         autoPlayInterval: Duration(
//                             seconds: 2), // Change image every 2 seconds
//                         aspectRatio: 16 / 9, // Adjust aspect ratio as needed
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _currentImageIndex = index;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30.0),

//                 // Scrollable list of schemes
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           // Handle navigation to Scheme 1
//                         },
//                         child: Text(
//                           'Scheme 1',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Handle navigation to Scheme 2
//                         },
//                         child: Text(
//                           'Scheme 2',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Handle navigation to Scheme 3
//                         },
//                         child: Text(
//                           'Scheme 3',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                       // Add more buttons for other schemes
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SignInPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Build your sign-in page UI here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: Text('Sign In Page'),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ward_connect/screens/member/App_Cot.dart';
import 'package:ward_connect/screens/user/complaint.dart';

import 'package:ward_connect/screens/user/profile.dart';

import 'package:ward_connect/screens/user/certificate_testi.dart';
import 'package:ward_connect/screens/user/login_screen.dart';
import 'package:ward_connect/screens/user/Counsellor_Details.dart'; // Import for carousel

import 'package:ward_connect/screens/member/Applied_Complaints.dart';
import 'package:ward_connect/screens/member/Scheme_App.dart';

void main() {
  runApp(MemberScreen());
}

class MemberScreen extends StatelessWidget {
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

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
      });
    });
  }

  void logout() {
    // Implement logout functionality here
    // For example, you can clear user session, remove tokens, etc.
    // After logout, navigate to the sign-in page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Ensure background image visibility
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Image.asset(
          'assets/WHITE.png', // Replace 'app_logo.png' with your app logo path
          width: 40, // Adjust width as needed
          height: 40, // Adjust height as needed
        ),
        title: Text(
          'e-WARD',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: logout,
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // // Background Image
            // Positioned.fill(
            //   child: Image.asset(
            //     'assets/rm222batch5-mind-25.jpg', // Change to your background image path
            //     fit: BoxFit.cover, // Adjusted to cover the whole body
            //   ),
            // ),
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

                  // Buttons for schemes, complaint of testimony, and complaints
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle navigation to AppliedScheme page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchemeApp()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 212, 209,
                                  209)), // Background color of the button
                          foregroundColor: MaterialStateProperty.all(
                              Colors.blue), // Text color of the button
                        ),
                        child: Text('Schemes'),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Handle navigation to CertificateTesti page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MViewCertificates()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 212, 209,
                                  209)), // Background color of the button
                          foregroundColor: MaterialStateProperty.all(
                              Colors.blue), // Text color of the button
                        ),
                        child: Text('Certificate of Testimony'),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Handle navigation to Complaint page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MViewComplaint()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 212, 209,
                                  209)), // Background color of the button
                          foregroundColor: MaterialStateProperty.all(
                              Colors.blue), // Text color of the button
                        ),
                        child: Text('Complaints'),
                      ),
                    ],
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
