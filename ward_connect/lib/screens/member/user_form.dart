import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ward_connect/screens/user/Status.dart';

class ApplicationFormPage extends StatefulWidget {
  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  late bool isButtonClicked;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController headOfHouseholdController;
  late TextEditingController phoneNumberController;
  late TextEditingController electionIdNumberController;
  late TextEditingController memberOfKudumbasreeController;
  late TextEditingController residentOfPanchayathController;
  late TextEditingController reasonsForPriorityController;
  late TextEditingController villageController;
  late TextEditingController surveyNumberController;
  late TextEditingController areaController;
  late TextEditingController pondController;
  late TextEditingController wellController;
  late TextEditingController pumpSetController;
  late TextEditingController othersIrrigationController;
  late TextEditingController cowController;
  late TextEditingController buildingController;
  late TextEditingController vehicleController;
  late TextEditingController othersIncomeController;
  late TextEditingController ownHouseController;
  late TextEditingController areaOfHouseController;
  late TextEditingController roofingController;
  late TextEditingController wallController;
  late TextEditingController floorController;
  late TextEditingController hasToiletController;
  late TextEditingController hasBeneficiariesController;
  late List<TextEditingController> beneficiaryNameControllers;
  late List<TextEditingController> beneficiaryBenefitControllers;
  late List<TextEditingController> beneficiaryYearControllers;
  late TextEditingController affidavitCheckedController;
  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    isButtonClicked = false;
    nameController = TextEditingController();
    ageController = TextEditingController();
    headOfHouseholdController = TextEditingController();
    phoneNumberController = TextEditingController();
    electionIdNumberController = TextEditingController();
    memberOfKudumbasreeController = TextEditingController();
    residentOfPanchayathController = TextEditingController();
    reasonsForPriorityController = TextEditingController();
    villageController = TextEditingController();
    surveyNumberController = TextEditingController();
    areaController = TextEditingController();
    pondController = TextEditingController();
    wellController = TextEditingController();
    pumpSetController = TextEditingController();
    othersIrrigationController = TextEditingController();
    cowController = TextEditingController();
    buildingController = TextEditingController();
    vehicleController = TextEditingController();
    othersIncomeController = TextEditingController();
    ownHouseController = TextEditingController();
    areaOfHouseController = TextEditingController();
    roofingController = TextEditingController();
    wallController = TextEditingController();
    floorController = TextEditingController();
    hasToiletController = TextEditingController();
    hasBeneficiariesController = TextEditingController();
    beneficiaryNameControllers = [];
    beneficiaryBenefitControllers = [];
    beneficiaryYearControllers = [];
    affidavitCheckedController = TextEditingController();
    statusController = TextEditingController();

    // Call method to fetch application form data
    fetchApplicationForm();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    headOfHouseholdController.dispose();
    phoneNumberController.dispose();
    electionIdNumberController.dispose();
    memberOfKudumbasreeController.dispose();
    residentOfPanchayathController.dispose();
    reasonsForPriorityController.dispose();
    villageController.dispose();
    surveyNumberController.dispose();
    areaController.dispose();
    pondController.dispose();
    wellController.dispose();
    pumpSetController.dispose();
    othersIrrigationController.dispose();
    cowController.dispose();
    buildingController.dispose();
    vehicleController.dispose();
    othersIncomeController.dispose();
    ownHouseController.dispose();
    areaOfHouseController.dispose();
    roofingController.dispose();
    wallController.dispose();
    floorController.dispose();
    hasToiletController.dispose();
    hasBeneficiariesController.dispose();
    beneficiaryNameControllers.forEach((controller) => controller.dispose());
    beneficiaryBenefitControllers.forEach((controller) => controller.dispose());
    beneficiaryYearControllers.forEach((controller) => controller.dispose());
    affidavitCheckedController.dispose();
    statusController.dispose();
  }

  // Method to fetch application form data from the API
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
          final jsonResponse = json.decode(response.body);
          setState(() {
            nameController.text = jsonResponse['nameOfApplicant'];
            ageController.text = jsonResponse['age'].toString();
            headOfHouseholdController.text = jsonResponse['headOfHousehold'];
            phoneNumberController.text = jsonResponse['phoneNumber'];
            electionIdNumberController.text = jsonResponse['electionIdNumber'];
            memberOfKudumbasreeController.text =
                jsonResponse['memberOfKudumbasree'];
            residentOfPanchayathController.text =
                jsonResponse['residentOfPanchayath'];
            reasonsForPriorityController.text =
                jsonResponse['reasonsForPriority'];
            villageController.text = jsonResponse['landOwned']['village'];
            surveyNumberController.text =
                jsonResponse['landOwned']['surveyNumber'];
            areaController.text = jsonResponse['landOwned']['area'];
            pondController.text =
                jsonResponse['irrigationDetails']['pond'].toString();
            wellController.text =
                jsonResponse['irrigationDetails']['well'].toString();
            pumpSetController.text =
                jsonResponse['irrigationDetails']['pumpSet'].toString();
            othersIrrigationController.text =
                jsonResponse['irrigationDetails']['others'].toString();
            cowController.text =
                jsonResponse['otherIncomeDetails']['cow'].toString();
            buildingController.text =
                jsonResponse['otherIncomeDetails']['building'].toString();
            vehicleController.text =
                jsonResponse['otherIncomeDetails']['vehicle'].toString();
            othersIncomeController.text =
                jsonResponse['otherIncomeDetails']['others'].toString();
            ownHouseController.text = jsonResponse['houseDetails']['ownHouse'];
            areaOfHouseController.text =
                jsonResponse['houseDetails']['areaOfHouse'];
            roofingController.text = jsonResponse['houseDetails']['roofing'];
            wallController.text = jsonResponse['houseDetails']['wall'];
            floorController.text = jsonResponse['houseDetails']['floor'];
            hasToiletController.text =
                jsonResponse['houseDetails']['hasToilet'];
            hasBeneficiariesController.text =
                jsonResponse['previousBeneficiaries']['hasBeneficiaries'];
            affidavitCheckedController.text =
                jsonResponse['affidavitChecked'].toString();
            statusController.text = jsonResponse['status'];
            // Populate beneficiary details
            for (var beneficiary in jsonResponse['previousBeneficiaries']
                ['beneficiaries']) {
              TextEditingController beneficiaryNameController =
                  TextEditingController(text: beneficiary['name']);
              beneficiaryNameControllers.add(beneficiaryNameController);
              TextEditingController beneficiaryBenefitController =
                  TextEditingController(text: beneficiary['benefitReceived']);
              beneficiaryBenefitControllers.add(beneficiaryBenefitController);
              TextEditingController beneficiaryYearController =
                  TextEditingController(text: beneficiary['yearReceived']);
              beneficiaryYearControllers.add(beneficiaryYearController);
            }
          });
        } else {
          throw Exception('Failed to load application form');
        }
      } catch (e) {
        print('Error fetching application form: $e');
      }
    } else {
      print('apId or schemeId is null');
    }
  }

  Future<void> approveScheme(String action) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? usId = prefs.getString('apId');
      String? schemeId = prefs.getString('schemeId');
      // final response = await http.put(
      //   Uri.parse(
      //       'http://localhost:8080/api/certificates/${action}/${apId}/${schemeId}'),
      // );
      final response = await http.put(
        Uri.parse(
            'http://localhost:8080/api/certificates/$action/$usId/$schemeId'),
      );

      if (response.statusCode == 200) {
        // If the request is successful, fetch the updated list of certificates
        await fetchApplicationForm();
      } else {
        throw Exception('Failed to approve certificate');
      }
    } catch (e) {
      print('Error approving certificate: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isApproved = statusController.text == 'Approved';
    bool isRejected = statusController.text == 'Rejected';
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Name of Applicant'),
            ),
            TextFormField(
              controller: ageController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextFormField(
              controller: headOfHouseholdController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Head of Household'),
            ),
            TextFormField(
              controller: phoneNumberController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: electionIdNumberController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Election ID Number'),
            ),
            TextFormField(
              controller: memberOfKudumbasreeController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Member of Kudumbasree'),
            ),
            TextFormField(
              controller: residentOfPanchayathController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Resident of Panchayath'),
            ),
            TextFormField(
              controller: reasonsForPriorityController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Reasons for Priority'),
            ),
            TextFormField(
              controller: villageController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Village'),
            ),
            TextFormField(
              controller: surveyNumberController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Survey Number'),
            ),
            TextFormField(
              controller: areaController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Area'),
            ),
            TextFormField(
              controller: pondController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Pond'),
            ),
            TextFormField(
              controller: wellController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Well'),
            ),
            TextFormField(
              controller: pumpSetController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Pump Set'),
            ),
            TextFormField(
              controller: othersIrrigationController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Others (Irrigation)'),
            ),
            TextFormField(
              controller: cowController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Cow'),
            ),
            TextFormField(
              controller: buildingController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Building'),
            ),
            TextFormField(
              controller: vehicleController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Vehicle'),
            ),
            TextFormField(
              controller: othersIncomeController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Others (Income)'),
            ),
            TextFormField(
              controller: ownHouseController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Own House'),
            ),
            TextFormField(
              controller: areaOfHouseController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Area of House'),
            ),
            TextFormField(
              controller: roofingController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Roofing'),
            ),
            TextFormField(
              controller: wallController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Wall'),
            ),
            TextFormField(
              controller: floorController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Floor'),
            ),
            TextFormField(
              controller: hasToiletController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Has Toilet'),
            ),
            TextFormField(
              controller: hasBeneficiariesController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Has Beneficiaries'),
            ),
            for (int i = 0; i < beneficiaryNameControllers.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: beneficiaryNameControllers[i],
                    readOnly: true,
                    decoration: InputDecoration(labelText: 'Beneficiary Name'),
                  ),
                  TextFormField(
                    controller: beneficiaryBenefitControllers[i],
                    readOnly: true,
                    decoration: InputDecoration(labelText: 'Benefit Received'),
                  ),
                  TextFormField(
                    controller: beneficiaryYearControllers[i],
                    readOnly: true,
                    decoration: InputDecoration(labelText: 'Year Received'),
                  ),
                ],
              ),
            TextFormField(
              controller: affidavitCheckedController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Affidavit Checked'),
            ),
            TextFormField(
              controller: statusController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 16.0),
            if (!isApproved &&
                !isRejected) // Show buttons if status is neither approved nor rejected
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: isButtonClicked
                        ? null
                        : () {
                            setState(() {
                              isButtonClicked = true;
                              isApproved = true;
                            });
                            approveScheme('approve');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Application Approved'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                            // Implement approve logic
                          },
                    child: Text('Approve'),
                  ),
                  ElevatedButton(
                    onPressed: isButtonClicked
                        ? null
                        : () {
                            setState(() {
                              isButtonClicked = true;
                              isRejected = true;
                            });
                            approveScheme('approve');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Application Rejected'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                            // Implement reject logic
                          },
                    child: Text('Reject'),
                  ),
                ],
              ),
            if (isApproved) // Show message if status is approved
              Text(
                'Application Approved',
                style: TextStyle(color: Colors.green),
              ),
            if (isRejected) // Show message if status is rejected
              Text(
                'Application Rejected',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
