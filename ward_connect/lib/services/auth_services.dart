import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ward_connect/models/complaints.dart' as ComplaintModel;
import 'package:ward_connect/models/user.dart';
import 'package:ward_connect/models/cot.dart';
import 'package:ward_connect/providers/user_provider.dart';
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
      User user = User(
        id: '',
        name: name,
        password: password,
        email: username,
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
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
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          print('Token stored: ${jsonDecode(res.body)['token']}');
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        },
      );
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
        builder: (context) => const SignupScreen(),
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
  }) async {
    try {
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
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Complaint Submitted',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
