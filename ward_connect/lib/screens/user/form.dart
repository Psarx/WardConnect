import 'package:flutter/material.dart';

void main() {
  runApp(AppForm());
}

class AppForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicationForm(),
    );
  }
}

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _affidavitChecked = false;
  String? _occupation;
  String? _roofing;
  String? _wall;
  String? _floor;
  bool _hasToilet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name Of Applicant'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Name of Head of Household'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name of head of household';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Election ID Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Election ID number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration(labelText: 'Member of Kudumbasree'),
                  value: _occupation,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _occupation = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text('Is a subscriber of Ashraya'),
                  value: false,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Occupation'),
                  value: _occupation,
                  items: <String>[
                    'Unmarried',
                    'Disabled',
                    'Fisherman',
                    'Widow',
                    'Mentally Challenged',
                    'Old Resident'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _occupation = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text('Permanent Resident of Panchayath'),
                  value: false,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  maxLines: 3,
                  decoration:
                      InputDecoration(labelText: 'Reasons for Priority'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide reasons for priority';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Village'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter village name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Survey Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter survey number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter area';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Wheat-area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter wheat area';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Coconut-count'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter coconut count';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Coconut-area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter coconut area';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Sesame-area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter sesame area';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vegetables-area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vegetables area';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Other-area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter other area';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Text('Pond'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Well'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Pump Set'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Others'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Text('Cow'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Building'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Vehicle'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Others'),
                  value: false,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text('Does the applicant own a house'),
                  value: false,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area of House'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter area of house';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Roofing'),
                  value: _roofing,
                  items: <String>['Concrete', 'Clay Tile', 'Others']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _roofing = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Wall'),
                  value: _wall,
                  items: <String>['Thatched', 'Mud', 'Brick', 'Others']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _wall = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Floor'),
                  value: _floor,
                  items: <String>['Cement', 'Mosaic', 'Tiles', 'Others']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _floor = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Toilet'),
                  value: _floor,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _floor = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name of Beneficiary'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name of beneficiary';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Benefit Received'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter benefit received';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Year'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter year';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Text(
                      'I hereby declare that the above information is true to the best of my knowledge.'),
                  value: _affidavitChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _affidavitChecked = value!;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _affidavitChecked) {
                      // Submit form data
                      // Perform further actions
                    } else {
                      // Show error message or handle invalid form
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
