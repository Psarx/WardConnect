class ApplicationFormModel {
  String? sid;
  String? usId;
  String? nameOfApplicant;
  int? age;
  String? headOfHousehold;
  String? phoneNumber;
  String? electionIDNumber;
  String? memberOfKudumbasree;
  String? residentOfPanchayath;
  String? reasonsForPriority;
  LandOwnedDetails? landOwned;
  IrrigationDetails? irrigationDetails;
  OtherIncomeDetails? otherIncomeDetails;
  HouseDetails? houseDetails;
  String? hasBeneficiaries;
  List<BeneficiaryDetails>? previousBeneficiaries;
  bool? affidavitChecked;
  String? status;

  ApplicationFormModel({
    this.sid,
    this.usId,
    this.nameOfApplicant,
    this.age,
    this.headOfHousehold,
    this.phoneNumber,
    this.electionIDNumber,
    this.memberOfKudumbasree,
    this.residentOfPanchayath,
    this.reasonsForPriority,
    this.landOwned,
    this.irrigationDetails,
    this.otherIncomeDetails,
    this.houseDetails,
    this.hasBeneficiaries,
    this.previousBeneficiaries,
    this.affidavitChecked,
    this.status,
  });

  factory ApplicationFormModel.fromJson(Map<String, dynamic> json) {
    return ApplicationFormModel(
      sid: json['sid'],
      usId: json['usId'],
      nameOfApplicant: json['nameOfApplicant'],
      age: json['age'],
      headOfHousehold: json['headOfHousehold'],
      phoneNumber: json['phoneNumber'],
      electionIDNumber: json['electionIdNumber'],
      memberOfKudumbasree: json['memberOfKudumbasree'],
      residentOfPanchayath: json['residentOfPanchayath'],
      reasonsForPriority: json['reasonsForPriority'],
      landOwned: LandOwnedDetails.fromJson(json['landOwned']),
      irrigationDetails: IrrigationDetails.fromJson(json['irrigationDetails']),
      otherIncomeDetails:
          OtherIncomeDetails.fromJson(json['otherIncomeDetails']),
      houseDetails: HouseDetails.fromJson(json['houseDetails']),
      hasBeneficiaries: json['previousBeneficiaries']['hasBeneficiaries'],
      previousBeneficiaries: List<BeneficiaryDetails>.from(
          json['previousBeneficiaries']['beneficiaries']
              .map((x) => BeneficiaryDetails.fromJson(x))),
      affidavitChecked: json['affidavitChecked'],
      status: json['status'],
    );
  }
}

class LandOwnedDetails {
  String? village;
  String? surveyNumber;
  String? area;

  LandOwnedDetails({
    this.village,
    this.surveyNumber,
    this.area,
  });

  factory LandOwnedDetails.fromJson(Map<String, dynamic> json) {
    return LandOwnedDetails(
      village: json['village'],
      surveyNumber: json['surveyNumber'],
      area: json['area'],
    );
  }
}

class IrrigationDetails {
  bool? pond;
  bool? well;
  bool? pumpSet;
  bool? others;

  IrrigationDetails({
    this.pond,
    this.well,
    this.pumpSet,
    this.others,
  });

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

  OtherIncomeDetails({
    this.cow,
    this.building,
    this.vehicle,
    this.others,
  });

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

  HouseDetails({
    this.ownHouse,
    this.areaOfHouse,
    this.roofing,
    this.wall,
    this.floor,
    this.hasToilet,
  });

  factory HouseDetails.fromJson(Map<String, dynamic> json) {
    return HouseDetails(
      ownHouse: json['ownHouse'],
      areaOfHouse: json['areaOfHouse'],
      roofing: json['roofing'],
      wall: json['wall'],
      floor: json['floor'],
      hasToilet: json['hasToilet'],
    );
  }
}

class BeneficiaryDetails {
  String? name;
  String? benefitReceived;
  String? yearReceived;

  BeneficiaryDetails({
    this.name,
    this.benefitReceived,
    this.yearReceived,
  });

  factory BeneficiaryDetails.fromJson(Map<String, dynamic> json) {
    return BeneficiaryDetails(
      name: json['name'],
      benefitReceived: json['benefitReceived'],
      yearReceived: json['yearReceived'],
    );
  }
}
