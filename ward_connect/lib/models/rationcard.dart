import 'dart:convert';

class Member {
  final int mid;
  final String name;
  final String relation;
  final int age;
  final String occupation;
  final int income;

  Member({
    required this.mid,
    required this.name,
    required this.relation,
    required this.age,
    required this.occupation,
    required this.income,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      mid: map['mid'],
      name: map['name'],
      relation: map['relation'],
      age: map['age'],
      occupation: map['occupation'],
      income: map['income'],
    );
  }
}

class Applied {
  final String rid;
  final int totalMembers;
  final List<Member> members;

  Applied({
    required this.rid,
    required this.totalMembers,
    required this.members,
  });

  Map<String, dynamic> toMap() {
    return {
      'rid': rid,
      'totalMembers': totalMembers,
      'members': members,
    };
  }

  factory Applied.fromMap(Map<String, dynamic> map) {
    List<Member> members = [];
    for (var memberData in map['members']) {
      members.add(Member.fromMap(memberData));
    }
    return Applied(
      rid: map['rid'],
      totalMembers: map['total_members'],
      members: members,
    );
  }
  String toJson() => json.encode(toMap());

  factory Applied.fromJson(String source) =>
      Applied.fromMap(json.decode(source));
}
