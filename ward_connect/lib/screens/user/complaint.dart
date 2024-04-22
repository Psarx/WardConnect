import 'package:flutter/material.dart';
import 'package:ward_connect/services/auth_services.dart';
import 'package:ward_connect/screens/user/home_screen.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _complaintController.dispose();
    super.dispose();
  }

  void _registerComplaint(BuildContext context) {
    try {
      _authService.registerComplaint(
        context: context,
        name: _nameController.text,
        phone: _phoneController.text,
        complaintText: _complaintController.text,
        onSuccess: (String message) {
          // Show the snackbar with the server message
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
      );

      // Clear text fields
      _nameController.clear();
      _phoneController.clear();
      _complaintController.clear();
    } catch (e) {
      // Show error message if any exception occurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Mention Your Complaints'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/waves.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _complaintController,
                  decoration: InputDecoration(
                    labelText: 'Write down the complaint',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _registerComplaint(context);
                  },
                  child: Text('Apply'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
