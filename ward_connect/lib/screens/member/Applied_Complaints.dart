// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// //import 'package:shared_preferences/shared_preferences.dart';

// class MViewComplaint extends StatefulWidget {
//   @override
//   _MViewComplaintState createState() => _MViewComplaintState();
// }

// class _MViewComplaintState extends State<MViewComplaint> {
//   List<Map<String, dynamic>> complaints = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchComplaints();
//   }

//   Future<void> fetchComplaints() async {
//     try {
//       //   SharedPreferences prefs = await SharedPreferences.getInstance();
//       //   String? userId = prefs.getString('user');

//       //   if (userId == null) {
//       //     throw Exception('User ID not found in SharedPreferences');
//       //   }

//       final response = await http.get(
//         Uri.parse('http://localhost:8080/api/user/mcomplaints'),
//         //headers: {'user': userId},
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           complaints =
//               List<Map<String, dynamic>>.from(json.decode(response.body));
//         });
//       } else {
//         throw Exception('Failed to load complaints');
//       }
//     } catch (e) {
//       print('Error fetching complaints: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Complaints'),
//       ),
//       body: ListView.builder(
//         itemCount: complaints.length,
//         itemBuilder: (context, index) {
//           final complaint = complaints[index];
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(12.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: ListTile(
//               title: Text('Applied user: ${complaint['name']}'),
//               subtitle: Text('Complaint: ${complaint['complaint']}'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MViewComplaint extends StatefulWidget {
  @override
  _MViewComplaintState createState() => _MViewComplaintState();
}

class _MViewComplaintState extends State<MViewComplaint> {
  List<Map<String, dynamic>> complaints = [];
  List<Map<String, dynamic>> filteredComplaints = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  Future<void> fetchComplaints() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/api/user/mcomplaints'),
      );

      if (response.statusCode == 200) {
        setState(() {
          complaints =
              List<Map<String, dynamic>>.from(json.decode(response.body));
          filteredComplaints = complaints; // Initialize filtered list
        });
      } else {
        throw Exception('Failed to load complaints');
      }
    } catch (e) {
      print('Error fetching complaints: $e');
    }
  }

  void filterComplaints(String query) {
    setState(() {
      filteredComplaints = complaints.where((complaint) {
        final userId = complaint['_id'].toString().toLowerCase();
        final name = complaint['name'].toString().toLowerCase();
        final complaintType = complaint['complaint'].toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return userId.contains(searchLower) ||
            name.contains(searchLower) ||
            complaintType.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Complaints'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search complaints',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    filterComplaints('');
                  },
                ),
              ),
              onChanged: (value) {
                filterComplaints(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredComplaints.length,
              itemBuilder: (context, index) {
                final complaint = filteredComplaints[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User ID: ${complaint['_id']}'),
                        Text('Applied user: ${complaint['name']}'),
                        Text('Phone Number: ${complaint['phone']}'),
                      ],
                    ),
                    subtitle: Text('Complaint: ${complaint['complaint']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
