// // import 'package:flutter/material.dart';
// // import 'package:ward_connect/screens/member/home_screen.dart';

// // void main() {
// //   runApp(SchemeApp());
// // }

// // class SchemeApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.blue,
// //           title: Text(
// //             'Applications Pending',
// //             style: TextStyle(color: Colors.white),
// //           ),
// //           leading: IconButton(
// //             icon: Icon(Icons.home),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => MemberScreen()),
// //               ); // Navigate to home screen or perform any action
// //             },
// //           ),
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Padding(
// //               //   padding: const EdgeInsets.symmetric(vertical: 8.0),
// //               //   child: Center(
// //               //     child: Text(
// //               //       'Applications',
// //               //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //               //     ),
// //               //   ),
// //               // ),
// //               Expanded(
// //                 child: SchemeList(schemes: [
// //                   'APPLICANT 1',
// //                   'APPLICANT 2',
// //                   'APPLICANT 3',
// //                 ]),
// //               ),
// //               //Padding(
// //               //padding: const EdgeInsets.symmetric(vertical: 8.0),
// //               //child: Center(
// //               //child: Text(
// //               //'Block Panchayath Schemes',
// //               //style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //               //),
// //               //),
// //               //),
// //               //Expanded(
// //               //child: SchemeList(schemes: [
// //               //'Scheme A',
// //               //'Scheme B',
// //               //'Scheme C',
// //               //]),
// //               //),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SchemeList extends StatelessWidget {
// //   final List<String> schemes;

// //   const SchemeList({Key? key, required this.schemes}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: schemes.length,
// //       itemBuilder: (context, index) {
// //         return Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 4.0),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 schemes[index],
// //                 style: TextStyle(fontSize: 16),
// //               ),
// //               TextButton(
// //                 onPressed: () {
// //                   // Handle Apply button press
// //                 },
// //                 style: ButtonStyle(
// //                   foregroundColor: MaterialStateProperty.all(Colors.blue),
// //                 ),
// //                 child: Text('Details'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:ward_connect/screens/member/Add_Scheme.dart';
// import 'package:ward_connect/screens/member/home_screen.dart';
// //import 'package:ward_connect/screens/member/Scheme_Details.dart';

// void main() {
//   runApp(SchemeApp());
// }

// class SchemeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text(
//             'Applications Pending',
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
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SchemeInfo()),
//                   );
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

import 'package:flutter/material.dart';
import 'package:ward_connect/screens/member/Scheme_App.dart';

class Scheme {
  final String sid;
  final String sdetails;
  final String stype;

  Scheme({
    required this.sid,
    required this.sdetails,
    required this.stype,
  });

  factory Scheme.fromJson(Map<String, dynamic> json) {
    return Scheme(
      sid: json['sid'],
      sdetails: json['sdetails'],
      stype: json['stype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sid': sid,
      'sdetails': sdetails,
      'stype': stype,
    };
  }
}

void main() {
  runApp(SchemeApp());
}

class SchemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Applications Pending',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    'Applications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: SchemeList(schemes: [
                  Scheme(sid: '1', sdetails: 'Details 1', stype: 'Type 1'),
                  Scheme(sid: '2', sdetails: 'Details 2', stype: 'Type 2'),
                  Scheme(sid: '3', sdetails: 'Details 3', stype: 'Type 3'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SchemeList extends StatelessWidget {
  final List<Scheme> schemes;

  const SchemeList({Key? key, required this.schemes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schemes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                schemes[index].sid,
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SchemeInfo(scheme: schemes[index])),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Details'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SchemeInfo extends StatelessWidget {
  final Scheme scheme;

  const SchemeInfo({Key? key, required this.scheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Scheme Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scheme ID: ${scheme.sid}'),
            SizedBox(height: 8),
            Text('Scheme Type: ${scheme.stype}'),
            SizedBox(height: 8),
            Text('Scheme Details: ${scheme.sdetails}'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showApprovalDialog(context);
                  },
                  child: Text('Approve'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showRejectionDialog(context);
                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showApprovalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Application Approved'),
          content: Text('The application has been approved.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchemeApp()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showRejectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Application Rejected'),
          content: Text('The application has been rejected.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchemeApp()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
