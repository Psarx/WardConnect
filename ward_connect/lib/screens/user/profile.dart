/*import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: ProfileUI(),
  ));
}

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/waves.jpg'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'MY PROFILE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile-pic.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('User id',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter user id',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Name:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Age:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Age',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Phone Number:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Phone Number',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('House Number:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter House Number',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('House Name:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter House Name',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Ration ID:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Ration ID',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Aadhaar Number:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Aadhaar Number',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text('Username:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Username',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
// import 'package:flutter/material.dart';
// import 'package:ward_connect/screens/user/home_screen.dart';

// void main() {
//   runApp(Directionality(
//     textDirection: TextDirection.ltr,
//     child: ProfileUI(),
//   ));
// }

// class ProfileUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'MY PROFILE',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.home),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreen()),
//             );
//             // Add your home icon functionality here
//           },
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/waves.jpg'), // Replace with your background image path
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 20.0),
//                   child: Text(
//                     'MY PROFILE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/profile-pic.png',
//                       width: 100.0,
//                       height: 100.0,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('User id',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter user id',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Name:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Name',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Age:', style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Age',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Phone Number:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Phone Number',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('House Number:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter House Number',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('House Name:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter House Name',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Ration ID:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Ration ID',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Aadhaar Number:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Aadhaar Number',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: <Widget>[
//                     Text('Username:',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10.0),
//                     Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter Username',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ward_connect/screens/user/home_screen.dart';
import 'package:ward_connect/screens/user/fetch_data.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: ProfileUI(),
  ));
}

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController userIdController;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController phoneNumberController;
  late TextEditingController houseNumberController;
  late TextEditingController houseNameController;
  late TextEditingController rationIdController;
  late TextEditingController aadhaarNumberController;
  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneNumberController = TextEditingController();
    houseNumberController = TextEditingController();
    houseNameController = TextEditingController();
    rationIdController = TextEditingController();
    aadhaarNumberController = TextEditingController();
    usernameController = TextEditingController();

    // Call method to fetch user data
    fetchUserData();
  }

  @override
  void dispose() {
    super.dispose();
    userIdController.dispose();
    nameController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    houseNumberController.dispose();
    houseNameController.dispose();
    rationIdController.dispose();
    aadhaarNumberController.dispose();
    usernameController.dispose();
  }

  // Method to fetch user data from the API
  void fetchUserData() async {
    final response = await fetchData('http://localhost:8080/api/user/details');
    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);
      // Update controllers with fetched data
      setState(() {
        userIdController.text = userData['usId'];
        nameController.text = userData['name'];
        ageController.text = userData['age'].toString();
        phoneNumberController.text = userData['phone'];
        houseNumberController.text = userData['hno'].toString();
        houseNameController.text = userData['hname'];
        rationIdController.text = userData['rid'].toString();
        aadhaarNumberController.text = userData['adhar_no'].toString();
        usernameController.text = userData['username'];
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'MY PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            // Add your home icon functionality here
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'MY PROFILE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            // Display fetched user data in TextFormFields
            TextFormField(
              controller: userIdController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'User ID',
              ),
            ),
            TextFormField(
              controller: nameController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: ageController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            TextFormField(
              controller: phoneNumberController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: houseNumberController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'House Number',
              ),
            ),
            TextFormField(
              controller: houseNameController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'House Name',
              ),
            ),
            TextFormField(
              controller: rationIdController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Ration ID',
              ),
            ),
            TextFormField(
              controller: aadhaarNumberController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Aadhaar Number',
              ),
            ),
            TextFormField(
              controller: usernameController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
