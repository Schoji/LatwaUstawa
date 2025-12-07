class MemberModel {
  final String accusativeName;
  final bool active;
  final String birthDate;
  final String birthLocation;
  final String club;
  final String districtName;
  final int districtNum;
  final String educationLevel;
  final String email;
  final String firstLastName;
  final String firstName;
  final String genitiveName;
  final int id;
  final String lastFirstName;
  final String lastName;
  final int numberOfVotes;
  final String profession;
  final String secondName;
  final String voivodeship;

  const MemberModel({
    required this.accusativeName,
    required this.active,
    required this.birthDate,
    required this.birthLocation,
    required this.club,
    required this.districtName,
    required this.districtNum,
    required this.educationLevel,
    required this.email,
    required this.firstLastName,
    required this.firstName,
    required this.genitiveName,
    required this.id,
    required this.lastFirstName,
    required this.lastName,
    required this.numberOfVotes,
    required this.profession,
    required this.secondName,
    required this.voivodeship,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      accusativeName: json['accusativeName'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      birthDate: json['birthDate'] as String? ?? '',
      birthLocation: json['birthLocation'] as String? ?? '',
      club: json['club'] as String? ?? '',
      districtName: json['districtName'] as String? ?? '',
      districtNum: json['districtNum'] as int? ?? 0,
      educationLevel: json['educationLevel'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstLastName: json['firstLastName'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      genitiveName: json['genitiveName'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      lastFirstName: json['lastFirstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      numberOfVotes: json['numberOfVotes'] as int? ?? 0,
      profession: json['profession'] as String? ?? '',
      secondName: json['secondName'] as String? ?? '',
      voivodeship: json['voivodeship'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accusativeName': accusativeName,
      'active': active,
      'birthDate': birthDate,
      'birthLocation': birthLocation,
      'club': club,
      'districtName': districtName,
      'districtNum': districtNum,
      'educationLevel': educationLevel,
      'email': email,
      'firstLastName': firstLastName,
      'firstName': firstName,
      'genitiveName': genitiveName,
      'id': id,
      'lastFirstName': lastFirstName,
      'lastName': lastName,
      'numberOfVotes': numberOfVotes,
      'profession': profession,
      'secondName': secondName,
      'voivodeship': voivodeship,
    };
  }

  @override
  String toString() => 'MemberModel(${toJson()})';
}
