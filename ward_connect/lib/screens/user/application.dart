import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ward_connect/screens/user/Scheme_page.dart';
import 'package:ward_connect/screens/user/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _headOfHouseholdController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _electionIDNumberController = TextEditingController();
  String? _memberOfKudumbasree;
  String? _residentOfPanchayath;
  TextEditingController _reasonsForPriorityController = TextEditingController();
  TextEditingController _villageController = TextEditingController();
  TextEditingController _surveyNumberController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  bool _pondChecked = false;
  bool _wellChecked = false;
  bool _pumpsetChecked = false;
  bool _othersChecked = false;
  bool _cowChecked = false;
  bool _buildingChecked = false;
  bool _vehicleChecked = false;
  bool _otherssChecked = false;
  String? _ownHouse;
  TextEditingController _areaOfHouseController = TextEditingController();
  String? _roofing;
  String? _wall;
  String? _floor;
  String? _hasToilet;
  String? _beneficiary;
  TextEditingController _beneficiaryNameController = TextEditingController();
  TextEditingController _benefitReceivedController = TextEditingController();
  TextEditingController _yearReceivedController = TextEditingController();
  bool _affidavitChecked = false;

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
            );
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
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name Of Applicant'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _headOfHouseholdController,
                  decoration:
                      InputDecoration(labelText: 'Name of Head of Household'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name of head of household';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _electionIDNumberController,
                  decoration: InputDecoration(labelText: 'Election ID Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Election ID number';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration(labelText: 'Member of Kudumbasree'),
                  value: _memberOfKudumbasree,
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _memberOfKudumbasree = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
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
                TextFormField(
                  controller: _reasonsForPriorityController,
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
                Text('Land Owned Details'),
                TextFormField(
                  controller: _villageController,
                  decoration: InputDecoration(labelText: 'Village'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _surveyNumberController,
                  decoration: InputDecoration(labelText: 'Survey Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _areaController,
                  decoration: InputDecoration(labelText: 'Area (in acre)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
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
                      value: _otherssChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _otherssChecked = value ?? false;
                        });
                      },
                    ),
                    Text('Others'),
                  ],
                ),
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
                TextFormField(
                  controller: _areaOfHouseController,
                  decoration:
                      InputDecoration(labelText: 'Area of House (in sq ft)'),
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
                TextFormField(
                  controller: _beneficiaryNameController,
                  decoration: InputDecoration(labelText: 'Name of Beneficiary'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _benefitReceivedController,
                  decoration: InputDecoration(labelText: 'Benefit Received'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _yearReceivedController,
                  decoration: InputDecoration(labelText: 'Year Received'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    return null;
                  },
                ),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        _affidavitChecked) {
                      // Prepare data
                      Map<String, dynamic> formData = {
                        'nameOfApplicant': _nameController.text,
                        'age': _ageController.text,
                        'headOfHousehold': _headOfHouseholdController.text,
                        'phoneNumber': _phoneNumberController.text,
                        'electionIdNumber': _electionIDNumberController.text,
                        'memberOfKudumbasree': _memberOfKudumbasree,
                        'residentOfPanchayath': _residentOfPanchayath,
                        'reasonsForPriority':
                            _reasonsForPriorityController.text,
                        'landOwned': {
                          'village': _villageController.text,
                          'surveyNumber': _surveyNumberController.text,
                          'area': _areaController.text
                        },
                        'irrigationDetails': {
                          'pond': _pondChecked,
                          'well': _wellChecked,
                          'pumpset': _pumpsetChecked,
                          'others': _othersChecked
                        },
                        'otherIncomeDetails': {
                          'cow': _cowChecked,
                          'building': _buildingChecked,
                          'vehicle': _vehicleChecked,
                          'others': _otherssChecked
                        },
                        'houseDetails': {
                          'ownHouse': _ownHouse,
                          'areaOfHouse': _areaOfHouseController.text,
                          'roofing': _roofing,
                          'wall': _wall,
                          'floor': _floor,
                          'hasToilet': _hasToilet
                        },
                        'previousBeneficiaries': {
                          'hasbeneficiary': _beneficiary,
                          'nameOfBeneficiary': _beneficiaryNameController.text,
                          'benefitReceived': _benefitReceivedController.text,
                          'yearReceived': _yearReceivedController.text
                        },
                        'affidavitChecked': _affidavitChecked
                      };

                      // Send data to backend
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? schemeId = prefs.getString('schemeId');
                      String? userId = prefs.getString('user');

                      try {
                        final response = await http.post(
                          Uri.parse('http://localhost:8080/api/application'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                            'sid': schemeId ?? '',
                            'user': userId ?? '', // Add userId to headers
                          },
                          body: jsonEncode(formData),
                        );

                        if (response.statusCode == 201) {
                          // Clear the form
                          _resetForm();

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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          throw Exception('Failed to submit application');
                        }
                      } catch (e) {
                        print('Error submitting application: $e');
                        // Handle error gracefully, e.g., show an error message to the user
                      }
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

  // Function to reset form fields and checkboxes
  void _resetForm() {
    setState(() {
      _formKey.currentState!.reset();
      _nameController.clear();
      _ageController.clear();
      _headOfHouseholdController.clear();
      _phoneNumberController.clear();
      _electionIDNumberController.clear();
      _memberOfKudumbasree = null;
      _residentOfPanchayath = null;
      _reasonsForPriorityController.clear();
      _villageController.clear();
      _surveyNumberController.clear();
      _areaController.clear();
      _pondChecked = false;
      _wellChecked = false;
      _pumpsetChecked = false;
      _othersChecked = false;
      _cowChecked = false;
      _buildingChecked = false;
      _vehicleChecked = false;
      _otherssChecked = false;
      _ownHouse = null;
      _areaOfHouseController.clear();
      _roofing = null;
      _wall = null;
      _floor = null;
      _hasToilet = null;
      _beneficiary = null;
      _beneficiaryNameController.clear();
      _benefitReceivedController.clear();
      _yearReceivedController.clear();
      _affidavitChecked = false;
    });
  }
}

void main() {
  runApp(AppForm());
}
