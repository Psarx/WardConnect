// import 'package:flutter/material.dart';
// import 'package:ward_connect/screens/member/home_screen.dart';

// void main() {
//   runApp(AppliedCot());
// }

// class AppliedCot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text(
//             'Cetificate Applicants',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context); // Navigate back to the previous screen
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Center(
//                   child: Text(
//                     'Applications',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SchemeList(schemes: [
//                   'APPLICANT 1',
//                   'APPLICANT 2',
//                   'APPLICANT 3',
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SchemeList extends StatelessWidget {
//   final List<String> schemes;

//   const SchemeList({Key? key, required this.schemes}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: schemes.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 schemes[index],
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Handle Apply button press
//                 },
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.all(Colors.blue),
//                 ),
//                 child: Text('Details'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:ward_connect/screens/member/COT.dart';

// // Assuming you have a backend service to fetch applicant details
// // and you have a function to fetch details which returns a JSON string
// // You need to replace 'fetchApplicantDetailsFromBackend()' with your actual backend call

// String fetchApplicantDetailsFromBackend() {
//   // Simulated JSON response from backend
//   return '''
//     {
//       "appliname": "John Doe",
//       "phone": "1234567890",
//       "details": "Reason for application: Seeking testimonial for employment"
//     }
//   ''';
// }

// void main() {
//   runApp(AppCot());
// }

// class AppCot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Applicant Details',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ApplicantDetailsPage(),
//     );
//   }
// }

// class ApplicantDetailsPage extends StatefulWidget {
//   @override
//   _ApplicantDetailsPageState createState() => _ApplicantDetailsPageState();
// }

// class _ApplicantDetailsPageState extends State<ApplicantDetailsPage> {
//   late CertificateofTestimony _applicantDetails;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch applicant details from backend
//     String jsonData = fetchApplicantDetailsFromBackend();
//     // Parse JSON data and initialize _applicantDetails
//     _applicantDetails = CertificateofTestimony.fromJson(jsonData);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Applicant Details'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => COT()),
//             );

//             /// Navigate back to the previous screen
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Applicant Name: ${_applicantDetails.appliname}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Phone Number: ${_applicantDetails.phone}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Reason for Application:',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               _applicantDetails.details,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ();
//               },
//               child: Text('Approve'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CertificateofTestimony {
//   final String appliname;
//   final String phone;
//   final String details;

//   CertificateofTestimony({
//     required this.appliname,
//     required this.phone,
//     required this.details,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'appliname': appliname,
//       'phone': phone,
//       'details': details,
//     };
//   }

//   factory CertificateofTestimony.fromMap(Map<String, dynamic> map) {
//     return CertificateofTestimony(
//       appliname: map['appliname'] ?? '',
//       phone: map['phone'] ?? '',
//       details: map['details'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CertificateofTestimony.fromJson(String source) =>
//       CertificateofTestimony.fromMap(json.decode(source));
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ward_connect/screens/member/COT.dart';

String fetchApplicantDetailsFromBackend() {
  // Simulated JSON response from backend
  return '''
    {
      "appliname": "John Doe",
      "phone": "1234567890",
      "details": "Reason for application: Seeking testimonial for employment"
    }
  ''';
}

void main() {
  runApp(AppCot());
}

class AppCot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applicant Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicantDetailsPage(),
    );
  }
}

class ApplicantDetailsPage extends StatefulWidget {
  @override
  _ApplicantDetailsPageState createState() => _ApplicantDetailsPageState();
}

class _ApplicantDetailsPageState extends State<ApplicantDetailsPage> {
  late CertificateofTestimony _applicantDetails;
  bool _isApproved = false;

  @override
  void initState() {
    super.initState();
    String jsonData = fetchApplicantDetailsFromBackend();
    _applicantDetails = CertificateofTestimony.fromJson(jsonData);
  }

  void _approveApplication() {
    setState(() {
      _isApproved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Applicant Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => COT()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applicant Name: ${_applicantDetails.appliname}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Phone Number: ${_applicantDetails.phone}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Reason for Application:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _applicantDetails.details,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            _isApproved
                ? Text(
                    'Approved',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  )
                : ElevatedButton(
                    onPressed: () {
                      _approveApplication();
                    },
                    child: Text('Approve'),
                  ),
          ],
        ),
      ),
    );
  }
}

class CertificateofTestimony {
  final String appliname;
  final String phone;
  final String details;

  CertificateofTestimony({
    required this.appliname,
    required this.phone,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'appliname': appliname,
      'phone': phone,
      'details': details,
    };
  }

  factory CertificateofTestimony.fromMap(Map<String, dynamic> map) {
    return CertificateofTestimony(
      appliname: map['appliname'] ?? '',
      phone: map['phone'] ?? '',
      details: map['details'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CertificateofTestimony.fromJson(String source) =>
      CertificateofTestimony.fromMap(json.decode(source));
}
