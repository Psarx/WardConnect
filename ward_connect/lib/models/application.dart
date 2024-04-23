import 'dart:convert';

class Application {
  final String nameOfApplicant;
  final int age;
  final String headOfHousehold;
  final String phoneNumber;
  final String electionIDNumber;
  final String memberOfKudumbasree;
  final String residentOfPanchayath;
  final String reasonsForPriority;
  final LandOwned landOwned;
  final IrrigationDetails irrigationDetails;
  final OtherIncomeDetails otherIncomeDetails;
  final HouseDetails houseDetails;
  final PreviousBeneficiaries previousBeneficiaries;
  final bool affidavitChecked;

  Application({
    required this.nameOfApplicant,
    required this.age,
    required this.headOfHousehold,
    required this.phoneNumber,
    required this.electionIDNumber,
    required this.memberOfKudumbasree,
    required this.residentOfPanchayath,
    required this.reasonsForPriority,
    required this.landOwned,
    required this.irrigationDetails,
    required this.otherIncomeDetails,
    required this.houseDetails,
    required this.previousBeneficiaries,
    required this.affidavitChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'nameOfApplicant': nameOfApplicant,
      'age': age,
      'headOfHousehold': headOfHousehold,
      'phoneNumber': phoneNumber,
      'electionIDNumber': electionIDNumber,
      'memberOfKudumbasree': memberOfKudumbasree,
      'residentOfPanchayath': residentOfPanchayath,
      'reasonsForPriority': reasonsForPriority,
      'landOwned': landOwned.toMap(),
      'irrigationDetails': irrigationDetails.toMap(),
      'otherIncomeDetails': otherIncomeDetails.toMap(),
      'houseDetails': houseDetails.toMap(),
      'previousBeneficiaries': previousBeneficiaries.toMap(),
      'affidavitChecked': affidavitChecked,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      nameOfApplicant: map['nameOfApplicant'] ?? '',
      age: map['age'] ?? 0,
      headOfHousehold: map['headOfHousehold'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      electionIDNumber: map['electionIDNumber'] ?? '',
      memberOfKudumbasree: map['memberOfKudumbasree'] ?? '',
      residentOfPanchayath: map['residentOfPanchayath'] ?? '',
      reasonsForPriority: map['reasonsForPriority'] ?? '',
      landOwned: LandOwned.fromMap(map['landOwned']),
      irrigationDetails: IrrigationDetails.fromMap(map['irrigationDetails']),
      otherIncomeDetails: OtherIncomeDetails.fromMap(map['otherIncomeDetails']),
      houseDetails: HouseDetails.fromMap(map['houseDetails']),
      previousBeneficiaries:
          PreviousBeneficiaries.fromMap(map['previousBeneficiaries']),
      affidavitChecked: map['affidavitChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source));
}

class LandOwned {
  final String village;
  final String surveyNumber;
  final String area;

  LandOwned({
    required this.village,
    required this.surveyNumber,
    required this.area,
  });

  Map<String, dynamic> toMap() {
    return {
      'village': village,
      'surveyNumber': surveyNumber,
      'area': area,
    };
  }

  factory LandOwned.fromMap(Map<String, dynamic> map) {
    return LandOwned(
      village: map['village'] ?? '',
      surveyNumber: map['surveyNumber'] ?? '',
      area: map['area'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LandOwned.fromJson(String source) =>
      LandOwned.fromMap(json.decode(source));
}

class IrrigationDetails {
  final bool pond;
  final bool well;
  final bool pumpSet;
  final bool others;

  IrrigationDetails({
    required this.pond,
    required this.well,
    required this.pumpSet,
    required this.others,
  });

  Map<String, dynamic> toMap() {
    return {
      'pond': pond,
      'well': well,
      'pumpSet': pumpSet,
      'others': others,
    };
  }

  factory IrrigationDetails.fromMap(Map<String, dynamic> map) {
    return IrrigationDetails(
      pond: map['pond'] ?? false,
      well: map['well'] ?? false,
      pumpSet: map['pumpSet'] ?? false,
      others: map['others'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory IrrigationDetails.fromJson(String source) =>
      IrrigationDetails.fromMap(json.decode(source));
}

class OtherIncomeDetails {
  final bool cow;
  final bool building;
  final bool vehicle;
  final bool others;

  OtherIncomeDetails({
    required this.cow,
    required this.building,
    required this.vehicle,
    required this.others,
  });

  Map<String, dynamic> toMap() {
    return {
      'cow': cow,
      'building': building,
      'vehicle': vehicle,
      'others': others,
    };
  }

  factory OtherIncomeDetails.fromMap(Map<String, dynamic> map) {
    return OtherIncomeDetails(
      cow: map['cow'] ?? false,
      building: map['building'] ?? false,
      vehicle: map['vehicle'] ?? false,
      others: map['others'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherIncomeDetails.fromJson(String source) =>
      OtherIncomeDetails.fromMap(json.decode(source));
}

class HouseDetails {
  final String ownHouse;
  final String areaOfHouse;
  final String roofing;
  final String wall;
  final String floor;
  final String hasToilet;

  HouseDetails({
    required this.ownHouse,
    required this.areaOfHouse,
    required this.roofing,
    required this.wall,
    required this.floor,
    required this.hasToilet,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownHouse': ownHouse,
      'areaOfHouse': areaOfHouse,
      'roofing': roofing,
      'wall': wall,
      'floor': floor,
      'hasToilet': hasToilet,
    };
  }

  factory HouseDetails.fromMap(Map<String, dynamic> map) {
    return HouseDetails(
      ownHouse: map['ownHouse'] ?? '',
      areaOfHouse: map['areaOfHouse'] ?? '',
      roofing: map['roofing'] ?? '',
      wall: map['wall'] ?? '',
      floor: map['floor'] ?? '',
      hasToilet: map['hasToilet'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HouseDetails.fromJson(String source) =>
      HouseDetails.fromMap(json.decode(source));
}

class PreviousBeneficiaries {
  final String hasBeneficiaries;
  final List<Beneficiary> beneficiaries;

  PreviousBeneficiaries({
    required this.hasBeneficiaries,
    required this.beneficiaries,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasBeneficiaries': hasBeneficiaries,
      'beneficiaries': beneficiaries.map((x) => x.toMap()).toList(),
    };
  }

  factory PreviousBeneficiaries.fromMap(Map<String, dynamic> map) {
    return PreviousBeneficiaries(
      hasBeneficiaries: map['hasBeneficiaries'] ?? '',
      beneficiaries: List<Beneficiary>.from(
          map['beneficiaries']?.map((x) => Beneficiary.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviousBeneficiaries.fromJson(String source) =>
      PreviousBeneficiaries.fromMap(json.decode(source));
}

class Beneficiary {
  final String name;
  final String benefitReceived;
  final String yearReceived;

  Beneficiary({
    required this.name,
    required this.benefitReceived,
    required this.yearReceived,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'benefitReceived': benefitReceived,
      'yearReceived': yearReceived,
    };
  }

  factory Beneficiary.fromMap(Map<String, dynamic> map) {
    return Beneficiary(
      name: map['name'] ?? '',
      benefitReceived: map['benefitReceived'] ?? '',
      yearReceived: map['yearReceived'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Beneficiary.fromJson(String source) =>
      Beneficiary.fromMap(json.decode(source));
}
