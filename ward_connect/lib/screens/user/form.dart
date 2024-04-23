import 'package:flutter/material.dart';
import 'package:ward_connect/screens/user/Scheme_page.dart';

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
  String? _hasToilet;
  String? _residentOfPanchayath;
  String? _ownHouse;
  String? _beneficiary;
  bool _pondChecked = false;
  bool _wellChecked = false;
  bool _pumpsetChecked = false;
  bool _othersChecked = false;
  bool _buildingChecked = false;
  bool _vehicleChecked = false;
  bool _cowChecked = false;
  bool _otherssChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Application Form'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SchemeScreen()),
            ); // Add your home icon functionality here
          },
        ),
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
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Permanent Resident of Panchayath'),
                  value: _residentOfPanchayath,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _residentOfPanchayath = newValue;
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
                Text('Land Owned Details'),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Village'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Survey Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Irrigation Details'),
                Row(
                  children: [
                    Checkbox(
                      value: _pondChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _pondChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Pond'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _wellChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _wellChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Well'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _pumpsetChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _pumpsetChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Pump Set'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _othersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _othersChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Others'),
                  ],
                ),
                // SizedBox(height: 16.0),
                // Text('Irrigation Details'),
                // CheckboxListTile(
                //   title: Text('Pond'),
                //   value: _pondChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _pondChecked = value ?? false;
                //       if (_pondChecked) {
                //         _wellChecked = false;
                //         _pumpsetChecked = false;
                //         _othersChecked = false;
                //       }
                //     });
                //   },
                // ),
                // CheckboxListTile(
                //   title: Text('Well'),
                //   value: _wellChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _wellChecked = value ?? false;
                //       if (_wellChecked) {
                //         _pondChecked = false;
                //         _pumpsetChecked = false;
                //         _othersChecked = false;
                //       }
                //     });
                //   },
                // ),
                // CheckboxListTile(
                //   title: Text('Pump Set'),
                //   value: _pumpsetChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _pumpsetChecked = value ?? false;
                //       if (_pumpsetChecked) {
                //         _pondChecked = false;
                //         _wellChecked = false;
                //         _othersChecked = false;
                //       }
                //     });
                //   },
                // ),
                // CheckboxListTile(
                //   title: Text('Others'),
                //   value: _othersChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _othersChecked = value ?? false;
                //       if (_othersChecked) {
                //         _pondChecked = false;
                //         _wellChecked = false;
                //         _pumpsetChecked = false;
                //       }
                //     });
                //   },
                // ),
                SizedBox(height: 16.0),
                Text('Other Income Details:'),
                Row(
                  children: [
                    Checkbox(
                      value: _cowChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _cowChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Cow'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _buildingChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _buildingChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Building'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _vehicleChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _vehicleChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Vehicle'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _othersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _othersChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Others'),
                  ],
                ),

                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Does the applicant own a house'),
                  value: _ownHouse,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _ownHouse = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area of House'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
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
                      return null;
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
                      return null;
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
                      return null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Does the house owned have toilet'),
                  value: _hasToilet,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _hasToilet = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText:
                          'Are there any previous benefitors from schemes'),
                  value: _beneficiary,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _beneficiary = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name of Beneficiary'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Benefit Received'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Year Received'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
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

                      // Clear the form
                      _formKey.currentState!.reset();

                      // Show application submitted message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Application Submitted'),
                            content: Text(
                                'Your application has been successfully submitted.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
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
