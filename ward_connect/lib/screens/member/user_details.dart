import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ward_connect/models/application.dart';

class ApplicationFormPage extends StatefulWidget {
  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  late Map<String, dynamic> responseData;
  ApplicationFormModel? applicationForm;
  Future<void> fetchApplicationForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apId = prefs.getString('apId');
    String? schemeId = prefs.getString('schemeId');

    if (apId != null && schemeId != null) {
      try {
        final response = await http.get(
          Uri.parse('http://localhost:8080/api/auth/applications'),
          headers: {
            'usId': apId,
            'sid': schemeId,
          },
        );

        if (response.statusCode == 200) {
          // Decode the JSON response
          dynamic jsonResponse = json.decode(response.body);

          if (jsonResponse is Map<String, dynamic>) {
            // Handle single application form
            setState(() {
              applicationForm = ApplicationFormModel.fromJson(jsonResponse);
            });
          } else {
            throw Exception('Unexpected response format');
          }
        } else {
          throw Exception('Failed to load application form');
        }
      } catch (e) {
        print('Error fetching application form: $e');
      }
    } else {
      // Handle case when apId or schemeId is null
      print('apId or schemeId is null');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchApplicationForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: applicationForm == null
    ? Center(child: CircularProgressIndicator())
    : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name of Applicant: ${applicationForm!.nameOfApplicant}'),
            Text('Age: ${applicationForm!.age}'),
            Text('Head of Household: ${applicationForm!.headOfHousehold}'),
            Text('Phone Number: ${applicationForm!.phoneNumber}'),
            Text('Election ID Number: ${applicationForm!.electionIdNumber}'),
            Text('Member of Kudumbasree: ${applicationForm!.memberOfKudumbasree}'),
            Text('Resident of Panchayath: ${applicationForm!.residentOfPanchayath}'),
            Text('Reasons for Priority: ${applicationForm!.reasonsForPriority}'),
            Text('Land Owned Details:'),
            Text('  Village: ${applicationForm!.landOwned["village"]}'),
            Text('  Survey Number: ${applicationForm!.landOwned["surveyNumber"]}'),
            Text('  Area: ${applicationForm!.landOwned["area"]}'),
            Text('Irrigation Details:'),
            Text('  Pond: ${applicationForm!.irrigationDetails["pond"]}'),
            Text('  Well: ${applicationForm!.irrigationDetails["well"]}'),
            Text('  Pump Set: ${applicationForm!.irrigationDetails["pumpSet"]}'),
            Text('  Others: ${applicationForm!.irrigationDetails["others"]}'),
            Text('Other Income Details:'),
            Text('  Cow: ${applicationForm!.otherIncomeDetails["cow"]}'),
            Text('  Building: ${applicationForm!.otherIncomeDetails["building"]}'),
            Text('  Vehicle: ${applicationForm!.otherIncomeDetails["vehicle"]}'),
            Text('  Others: ${applicationForm!.otherIncomeDetails["others"]}'),
            Text('House Details:'),
            Text('  Own House: ${applicationForm!.houseDetails["ownHouse"]}'),
            Text('  Area of House: ${applicationForm!.houseDetails["areaOfHouse"]}'),
            Text('  Roofing: ${applicationForm!.houseDetails["roofing"]}'),
            Text('  Wall: ${applicationForm!.houseDetails["wall"]}'),
            Text('  Floor: ${applicationForm!.houseDetails["floor"]}'),
            Text('  Has Toilet: ${applicationForm!.houseDetails["hasToilet"]}'),
            Text('Previous Beneficiaries:'),
            for (var beneficiary in applicationForm!.previousBeneficiaries["beneficiaries"])
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Name: ${beneficiary["name"]}'),
                  Text('  Benefit Received: ${beneficiary["benefitReceived"]}'),
                  Text('  Year Received: ${beneficiary["yearReceived"]}'),
                ],
              ),
            Text('Affidavit Checked: ${applicationForm!.affidavitChecked}'),
          ],
        ),
      ),

              ),
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ApplicationFormPage(),
  ));
}
