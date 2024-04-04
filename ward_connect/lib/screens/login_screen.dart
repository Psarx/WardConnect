import 'package:flutter/material.dart';
import 'package:ward_connect/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  void loginUser() {
    authService.signInUser(
      context: context,
      email: _usernameController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/17306.jpg'), // Replace with your image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 150.0),
                // Hello Sign In Text
                Container(
                  color: const Color.fromARGB(93, 255, 255, 255),
                  child: Text(
                    'Hello, Sign in!',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),

                // Username Text Field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),

                // Password Text Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Hide password characters
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),

                // Sign In Button
                ElevatedButton(
                  onPressed: loginUser,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  child: Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
