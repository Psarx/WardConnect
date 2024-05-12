import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ward_connect/models/complaints.dart' as ComplaintModel;
import 'package:ward_connect/models/user.dart';
import 'package:ward_connect/models/cot.dart';
import 'package:ward_connect/providers/user_provider.dart';
import 'package:ward_connect/screens/member/home_screen.dart';
import 'package:ward_connect/screens/user/complaint.dart';
import 'package:ward_connect/screens/user/home_screen.dart';
import 'package:ward_connect/screens/user/signup_screen.dart';
import 'package:ward_connect/screens/user/certificate_testi.dart';
import 'package:ward_connect/utils/constants.dart';
import 'package:ward_connect/utils/utils.dart';
import 'package:provider/provider.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String username,
    required String password,
    required String name,
  }) async {
    try {
      // Create a User object with the provided data
      Map<String, dynamic> userData = {
        'name': name,
        'username': username,
        'password': password,
      };

      // Send a POST request to the signup endpoint
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/auth/signup'),
        body: jsonEncode(userData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check the response status and handle accordingly
      if (res.statusCode == 201) {
        // Account created successfully
        showSnackBar(
          context,
          'Account created! Login with the same credentials!',
        );
      } else {
        // Account creation failed
        showSnackBar(
          context,
          'Failed to create account. Please try again later.',
        );
      }
    } catch (e) {
      // Error occurred during signup
      showSnackBar(context, 'Error: $e');
    }
  }

  void signInUser({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signin'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('Sign In Response: ${res.statusCode} ${res.body}');
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        userProvider.setUser(res.body);
        await prefs.setString('Authorization', jsonDecode(res.body)['token']);
        await prefs.setString('user', jsonDecode(res.body)['_id']);
        print('Token stored: ${jsonDecode(res.body)['token']}');

        // Check the username and redirect accordingly
        if (username.startsWith('USER')) {
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        } else if (username.startsWith('WUSER')) {
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MemberScreen(),
            ),
            (route) => false,
          );
        } else {
          // Handle other cases if necessary
        }
      } else if (res.statusCode == 400) {
        // Display error message from backend
        String errorMessage = jsonDecode(res.body)['message'];
        showSnackBar(context, errorMessage);
      } else {
        // Handle other status codes if necessary
        showSnackBar(context, 'Failed to sign in. Please try again later.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
      (route) => false,
    );
  }

  void applyForCertificate({
    required BuildContext context,
    required String appliname,
    required String phone,
    required String details,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String usId = prefs.getString('user') ?? '';
      CertificateofTestimony cot = CertificateofTestimony(
        appliname: appliname,
        phone: phone,
        details: details,
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/certificate'),
        body: cot.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'usId': usId,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Request Submitted',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void registerComplaint({
    required BuildContext context,
    required String name,
    required String phone,
    required String complaintText,
    required Function(String) onSuccess, // Callback to handle success message
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String usId = prefs.getString('user') ??
          ''; // Retrieve usId from shared preferences

      ComplaintModel.Complaints complaint = ComplaintModel.Complaints(
        name: name,
        phone: phone,
        complaint: complaintText,
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/complaint'),
        body: complaint.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'usId': usId,
        },
      );

      print('Response status code: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 201) {
        Map<String, dynamic> data = json.decode(res.body);
        String serverMessage = data['message'];
        onSuccess(
            serverMessage); // Call the onSuccess callback with the server message
      } else {
        showSnackBar(context, 'Error: ${res.statusCode}');
      }
    } catch (e) {
      showSnackBar(context, 'Error: $e');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
