// import 'package:flutter/material.dart';
// import 'package:ward_connect/screens/member/home_screen.dart';

// void main() {
//   runApp(AppliedComplaints());
// }

// class AppliedComplaints extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text(
//             'Complaints',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MemberScreen()),
//               ); // Navigate to home screen or perform any action
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(vertical: 8.0),
//               //   child: Center(
//               //     child: Text(
//               //       'Applications',
//               //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               //     ),
//               //   ),
//               // ),
//               Expanded(
//                 child: SchemeList(schemes: [
//                   'COMP 1',
//                   'COMP 2',
//                   'COMP 3',
//                 ]),
//               ),
//               //Padding(
//               //padding: const EdgeInsets.symmetric(vertical: 8.0),
//               //child: Center(
//               //child: Text(
//               //'Block Panchayath Schemes',
//               //style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               //),
//               //),
//               //),
//               //Expanded(
//               //child: SchemeList(schemes: [
//               //'Scheme A',
//               //'Scheme B',
//               //'Scheme C',
//               //]),
//               //),
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
//               //TextButton(
//               //onPressed: () {
//               // Handle Apply button press
//               //},
//               //style: ButtonStyle(
//               //foregroundColor: MaterialStateProperty.all(Colors.blue),
//               //),
//               //child: Text('View'),
//               //),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ward_connect/screens/member/home_screen.dart';

// Assuming you have a backend service to fetch complaints data
// and you have a function to fetch complaints which returns a List of JSON strings
// You need to replace 'fetchComplaintsFromBackend()' with your actual backend call

List<String> fetchComplaintsFromBackend() {
  // Simulated JSON response from backend
  return [
    '''
    {
      "name": "Alice",
      "phone": "1234567890",
      "complaint": "Slow internet connection"
    }
    ''',
    '''
    {
      "name": "Bob",
      "phone": "9876543210",
      "complaint": "High electricity bills"
    }
    ''',
    // Add more complaints JSON strings as needed
  ];
}

void main() {
  runApp(AppliedComp());
}

class AppliedComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaints List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ComplaintsListPage(),
    );
  }
}

class ComplaintsListPage extends StatefulWidget {
  @override
  _ComplaintsListPageState createState() => _ComplaintsListPageState();
}

class _ComplaintsListPageState extends State<ComplaintsListPage> {
  late List<Complaints> _complaintsList;

  @override
  void initState() {
    super.initState();
    // Fetch complaints data from backend
    List<String> jsonList = fetchComplaintsFromBackend();
    // Parse JSON data and initialize _complaintsList
    _complaintsList =
        jsonList.map((jsonString) => Complaints.fromJson(jsonString)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Complaints List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemberScreen()),
            ); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _complaintsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_complaintsList[index].name),
            subtitle: Text(_complaintsList[index].complaint),
            trailing: Text(_complaintsList[index].phone),
          );
        },
      ),
    );
  }
}

class Complaints {
  final String name;
  final String phone;
  final String complaint;

  Complaints({
    required this.name,
    required this.phone,
    required this.complaint,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'complaint': complaint,
    };
  }

  factory Complaints.fromMap(Map<String, dynamic> map) {
    return Complaints(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      complaint: map['complaint'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Complaints.fromJson(String source) =>
      Complaints.fromMap(json.decode(source));
}
