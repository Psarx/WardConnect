import 'package:flutter/material.dart';

void main() {
  runApp(SchemeScreen());
}

class SchemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Schemes',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to home screen or perform any action
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
                    'District Council Schemes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: SchemeList(schemes: [
                  'Scheme 1',
                  'Scheme 2',
                  'Scheme 3',
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    'Block Panchayath Schemes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: SchemeList(schemes: [
                  'Scheme A',
                  'Scheme B',
                  'Scheme C',
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
  final List<String> schemes;

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
                schemes[index],
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  // Handle Apply button press
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }
}