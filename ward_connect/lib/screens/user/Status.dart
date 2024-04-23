// import 'dart:convert';
// import 'package:flutter/material.dart';

// // Function to fetch scheme application data from the database
// Future<List<SchemeApplication>> fetchSchemeApplications() async {
//   // Simulated JSON response from the database
//   String jsonData = '''
//     [
//       {"schemeName": "Scheme 1", "status": "Approved"},
//       {"schemeName": "Scheme 2", "status": "Pending"},
//       {"schemeName": "Scheme 3", "status": "Rejected"}
//     ]
//   ''';

//   // Parse JSON data
//   List<dynamic> jsonList = json.decode(jsonData);
//   // Convert JSON data to List of SchemeApplication objects
//   List<SchemeApplication> schemeApplications =
//       jsonList.map((e) => SchemeApplication.fromJson(e)).toList();

//   return schemeApplications;
// }

// void main() {
//   runApp(Status());
// }

// class Status extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       backgroundColor: Colors.blue,
//       title: 'Scheme Application Status',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SchemeApplicationPage(),
//     );
//   }
// }

// class SchemeApplicationPage extends StatefulWidget {
//   @override
//   _SchemeApplicationPageState createState() => _SchemeApplicationPageState();
// }

// class _SchemeApplicationPageState extends State<SchemeApplicationPage> {
//   late Future<List<SchemeApplication>> _schemeApplicationsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _schemeApplicationsFuture = fetchSchemeApplications();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scheme Application Status'),
//       ),
//       body: FutureBuilder<List<SchemeApplication>>(
//         future: _schemeApplicationsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<SchemeApplication>? schemeApplications = snapshot.data;
//             if (schemeApplications != null && schemeApplications.isNotEmpty) {
//               return ListView.builder(
//                 itemCount: schemeApplications.length,
//                 itemBuilder: (context, index) {
//                   SchemeApplication application = schemeApplications[index];
//                   return ListTile(
//                     title: Text(application.schemeName),
//                     subtitle: Text('Status: ${application.status}'),
//                   );
//                 },
//               );
//             } else {
//               return Center(child: Text('No scheme applications found.'));
//             }
//           }
//         },
//       ),
//     );
//   }
// }

// class SchemeApplication {
//   final String schemeName;
//   final String status;

//   SchemeApplication({
//     required this.schemeName,
//     required this.status,
//   });

//   factory SchemeApplication.fromJson(Map<String, dynamic> json) {
//     return SchemeApplication(
//       schemeName: json['schemeName'] ?? '',
//       status: json['status'] ?? '',
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ward_connect/screens/user/home_screen.dart';

// Function to fetch scheme application data from the database
Future<List<SchemeApplication>> fetchSchemeApplications() async {
  // Simulated JSON response from the database
  String jsonData = '''
    [
      {"schemeName": "Scheme 1", "status": "Approved"},
      {"schemeName": "Scheme 2", "status": "Pending"},
      {"schemeName": "Scheme 3", "status": "Rejected"}
    ]
  ''';

  // Parse JSON data
  List<dynamic> jsonList = json.decode(jsonData);
  // Convert JSON data to List of SchemeApplication objects
  List<SchemeApplication> schemeApplications =
      jsonList.map((e) => SchemeApplication.fromJson(e)).toList();

  return schemeApplications;
}

void main() {
  runApp(Status());
}

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scheme Application Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchemeApplicationPage(),
    );
  }
}

class SchemeApplicationPage extends StatefulWidget {
  @override
  _SchemeApplicationPageState createState() => _SchemeApplicationPageState();
}

class _SchemeApplicationPageState extends State<SchemeApplicationPage> {
  late Future<List<SchemeApplication>> _schemeApplicationsFuture;

  @override
  void initState() {
    super.initState();
    _schemeApplicationsFuture = fetchSchemeApplications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change background color to blue
        title: Text('Scheme Application Status'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<SchemeApplication>>(
        future: _schemeApplicationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<SchemeApplication>? schemeApplications = snapshot.data;
            if (schemeApplications != null && schemeApplications.isNotEmpty) {
              return ListView.builder(
                itemCount: schemeApplications.length,
                itemBuilder: (context, index) {
                  SchemeApplication application = schemeApplications[index];
                  return ListTile(
                    title: Text(application.schemeName),
                    subtitle: Text('Status: ${application.status}'),
                  );
                },
              );
            } else {
              return Center(child: Text('No scheme applications found.'));
            }
          }
        },
      ),
    );
  }
}

class SchemeApplication {
  final String schemeName;
  final String status;

  SchemeApplication({
    required this.schemeName,
    required this.status,
  });

  factory SchemeApplication.fromJson(Map<String, dynamic> json) {
    return SchemeApplication(
      schemeName: json['schemeName'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
