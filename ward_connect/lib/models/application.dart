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
}

class LandOwnedDetails {
  String? village;
  String? surveyNumber;
  String? area;

  LandOwnedDetails({this.village, this.surveyNumber, this.area});
}

class IrrigationDetails {
  bool? pond;
  bool? well;
  bool? pumpSet;
  bool? others;

  IrrigationDetails({this.pond, this.well, this.pumpSet, this.others});
}

class OtherIncomeDetails {
  bool? cow;
  bool? building;
  bool? vehicle;
  bool? others;

  OtherIncomeDetails({this.cow, this.building, this.vehicle, this.others});
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
}

class BeneficiaryDetails {
  String? name;
  String? benefitReceived;
  String? yearReceived;

  BeneficiaryDetails({this.name, this.benefitReceived, this.yearReceived});
}
