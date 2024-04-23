import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApplicationFormScreen extends StatefulWidget {
  final String usid;
  final String sid;

  ApplicationFormScreen({required this.usid, required this.sid});

  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  ApplicationFormModel? applicationForm;

  @override
  void initState() {
    super.initState();
    fetchApplicationForm();
  }

  Future<void> fetchApplicationForm() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/api/auth/applications'),
        headers: {'usid': widget.usid, 'sid': widget.sid},
      );

      if (response.statusCode == 200) {
        // Check if the response body is null
        if (response.body != null && response.body.isNotEmpty) {
          setState(() {
            applicationForm =
                ApplicationFormModel.fromJson(json.decode(response.body));
          });
        } else {
          // Handle the case when the response body is null
          throw Exception('Empty response body');
        }
      } else {
        throw Exception('Failed to load application form');
      }
    } catch (e) {
      print('Error fetching application form: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
      ),
      body: applicationForm != null
          ? SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Name of Applicant: ${applicationForm!.nameOfApplicant}'),
                  Text('Age: ${applicationForm!.age}'),
                  Text(
                      'Head of Household: ${applicationForm!.headOfHousehold}'),
                  Text('Phone Number: ${applicationForm!.phoneNumber}'),
                  Text(
                      'Election ID Number: ${applicationForm!.electionIDNumber}'),
                  Text(
                      'Member of Kudumbasree: ${applicationForm!.memberOfKudumbasree}'),
                  Text(
                      'Resident of Panchayath: ${applicationForm!.residentOfPanchayath}'),
                  Text(
                      'Reasons for Priority: ${applicationForm!.reasonsForPriority}'),
                  Text('Land Owned Details:'),
                  Text(
                      '  Village: ${applicationForm!.landOwnedDetails!.village}'),
                  Text(
                      '  Survey Number: ${applicationForm!.landOwnedDetails!.surveyNumber}'),
                  Text('  Area: ${applicationForm!.landOwnedDetails!.area}'),
                  Text('Irrigation Details:'),
                  Text('  Pond: ${applicationForm!.irrigationDetails!.pond}'),
                  Text('  Well: ${applicationForm!.irrigationDetails!.well}'),
                  Text(
                      '  Pump Set: ${applicationForm!.irrigationDetails!.pumpSet}'),
                  Text(
                      '  Others: ${applicationForm!.irrigationDetails!.others}'),
                  Text('Other Income Details:'),
                  Text('  Cow: ${applicationForm!.otherIncomeDetails!.cow}'),
                  Text(
                      '  Building: ${applicationForm!.otherIncomeDetails!.building}'),
                  Text(
                      '  Vehicle: ${applicationForm!.otherIncomeDetails!.vehicle}'),
                  Text(
                      '  Others: ${applicationForm!.otherIncomeDetails!.others}'),
                  Text('House Details:'),
                  Text(
                      '  Own House: ${applicationForm!.houseDetails!.ownHouse}'),
                  Text(
                      '  Area of House: ${applicationForm!.houseDetails!.areaOfHouse}'),
                  Text('  Roofing: ${applicationForm!.houseDetails!.roofing}'),
                  Text('  Wall: ${applicationForm!.houseDetails!.wall}'),
                  Text('  Floor: ${applicationForm!.houseDetails!.floor}'),
                  Text(
                      '  Has Toilet: ${applicationForm!.houseDetails!.hasToilet}'),
                  Text('Has Beneficiary: ${applicationForm!.hasbeneficiary}'),
                  Text('Previous Beneficiaries:'),
                  for (var beneficiary
                      in applicationForm!.previousBeneficiaries!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('  Name: ${beneficiary.name}'),
                        Text(
                            '  Benefit Received: ${beneficiary.benefitReceived}'),
                        Text('  Year Received: ${beneficiary.yearReceived}'),
                      ],
                    ),
                  Text(
                      'Affidavit Checked: ${applicationForm!.affidavitChecked}'),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ApplicationFormModel {
  String? nameOfApplicant;
  int? age;
  String? headOfHousehold;
  String? phoneNumber;
  String? electionIDNumber;
  String? memberOfKudumbasree;
  String? residentOfPanchayath;
  String? reasonsForPriority;
  LandOwnedDetails? landOwnedDetails;
  IrrigationDetails? irrigationDetails;
  OtherIncomeDetails? otherIncomeDetails;
  HouseDetails? houseDetails;
  String? hasbeneficiary;
  List<BeneficiaryDetails>? previousBeneficiaries;
  bool? affidavitChecked;

  ApplicationFormModel({
    this.nameOfApplicant,
    this.age,
    this.headOfHousehold,
    this.phoneNumber,
    this.electionIDNumber,
    this.memberOfKudumbasree,
    this.residentOfPanchayath,
    this.reasonsForPriority,
    this.landOwnedDetails,
    this.irrigationDetails,
    this.otherIncomeDetails,
    this.houseDetails,
    this.previousBeneficiaries,
    this.affidavitChecked,
  });

  factory ApplicationFormModel.fromJson(Map<String, dynamic>? json) {
    return ApplicationFormModel(
      nameOfApplicant: json?['nameOfApplicant'] ?? '',
      age: json?['age'],
      headOfHousehold: json?['headOfHousehold'] ?? '',
      phoneNumber: json?['phoneNumber'] ?? '',
      electionIDNumber: json?['electionIDNumber'] ?? '',
      memberOfKudumbasree: json?['memberOfKudumbasree'] ?? '',
      residentOfPanchayath: json?['residentOfPanchayath'] ?? '',
      reasonsForPriority: json?['reasonsForPriority'] ?? '',
      landOwnedDetails: LandOwnedDetails.fromJson(json?['landOwnedDetails']),
      irrigationDetails: IrrigationDetails.fromJson(json?['irrigationDetails']),
      otherIncomeDetails:
          OtherIncomeDetails.fromJson(json?['otherIncomeDetails']),
      houseDetails: HouseDetails.fromJson(json?['houseDetails']),
      previousBeneficiaries: (json?['previousBeneficiaries'] as List<dynamic>?)
          ?.map((e) => BeneficiaryDetails.fromJson(e))
          .toList(),
      affidavitChecked: json?['affidavitChecked'],
    );
  }
}

class LandOwnedDetails {
  String? village;
  String? surveyNumber;
  String? area;

  LandOwnedDetails({this.village, this.surveyNumber, this.area});

  factory LandOwnedDetails.fromJson(Map<String, dynamic>? json) {
    return LandOwnedDetails(
      village: json?['village'] ?? '',
      surveyNumber: json?['surveyNumber'] ?? '',
      area: json?['area'] ?? '',
    );
  }
}

class IrrigationDetails {
  bool? pond;
  bool? well;
  bool? pumpSet;
  bool? others;

  IrrigationDetails({this.pond, this.well, this.pumpSet, this.others});

  factory IrrigationDetails.fromJson(Map<String, dynamic> json) {
    return IrrigationDetails(
      pond: json['pond'],
      well: json['well'],
      pumpSet: json['pumpSet'],
      others: json['others'],
    );
  }
}

class OtherIncomeDetails {
  bool? cow;
  bool? building;
  bool? vehicle;
  bool? others;

  OtherIncomeDetails({this.cow, this.building, this.vehicle, this.others});

  factory OtherIncomeDetails.fromJson(Map<String, dynamic> json) {
    return OtherIncomeDetails(
      cow: json['cow'],
      building: json['building'],
      vehicle: json['vehicle'],
      others: json['others'],
    );
  }
}

class HouseDetails {
  String? ownHouse;
  String? areaOfHouse;
  String? roofing;
  String? wall;
  String? floor;
  String? hasToilet;

  HouseDetails(
      {this.ownHouse,
      this.areaOfHouse,
      this.roofing,
      this.wall,
      this.floor,
      this.hasToilet});

  factory HouseDetails.fromJson(Map<String, dynamic>? json) {
    return HouseDetails(
      ownHouse: json?['ownHouse'] ?? '',
      areaOfHouse: json?['areaOfHouse'] ?? '',
      roofing: json?['roofing'] ?? '',
      wall: json?['wall'] ?? '',
      floor: json?['floor'] ?? '',
      hasToilet: json?['hasToilet'] ?? '',
    );
  }
}

class BeneficiaryDetails {
  String? name;
  String? benefitReceived;
  String? yearReceived;

  BeneficiaryDetails({this.name, this.benefitReceived, this.yearReceived});

  factory BeneficiaryDetails.fromJson(Map<String, dynamic> json) {
    return BeneficiaryDetails(
      name: json['name'] ?? '', // Provide an empty string as default value
      benefitReceived: json['benefitReceived'] ??
          '', // Provide an empty string as default value
      yearReceived: json['yearReceived'] ??
          '', // Provide an empty string as default value
    );
  }
}
