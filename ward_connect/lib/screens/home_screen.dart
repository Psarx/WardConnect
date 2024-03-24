import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _btn(context),
              // _drwr(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  // ignore: prefer_const_constructors
  return Column(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      const Text(
        "User",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      //const Text("Enter your credentials to login: "),
    ],
  );
}

Widget _btn(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        // ignore: sort_child_properties_last

        child: const Text(
          "Schemes",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        // ignore: sort_child_properties_last

        child: const Text(
          "Testimony Certificates",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    ],
  );
}
