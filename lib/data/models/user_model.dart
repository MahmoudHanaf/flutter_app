class UserModel {
  String? status;
  UserDataModel? data;

  UserModel({
    this.status,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      status: json['status'],
      data: json['data'] != null ? UserDataModel.fromJson(json['data']) : null);
}

class UserDataModel {
  String? userId;
  String? username;
  String? password;
  String? phone;
  String? levelId;

  UserDataModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.phone,
    required this.levelId,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
      userId: json['student_id'],
      username: json['student_name'],
      phone: json['student_phone'],
      password: json['student_password'],
      levelId: json['student_level_id']);

  Map<String, dynamic> toJson() => {
        "student_id": userId,
        "student_name": username,
        "student_password": password,
        "student_phone": phone,
        "student_level_id": levelId,
      };
} 

//class UserModel extends User {
//   UserModel({
//     required super.userId,
//     required super.userName,
//     required super.userEmail,
//     required super.userPassword,
//     required super.userCommercialNum,
//     required super.userTaxNum,
//     required super.approved,
//     required super.accountCreatedAt,
//     required super.userPumpsNum,
//     required super.startFreeTrail,
//     required super.endFreeTrail,
//   });
//   UserModel copyWith({
//     String? userId,
//     String? userName,
//     String? userEmail,
//     String? userPassword,
//     String? userCommercialNum,
//     int? userTaxNum,
//     UserApproved? approved,
//     DateTime? accountCreatedAt,
//     int? userPumpsNum,
//     String? freePeriod,
//   }) =>
//       UserModel(
//         userId: userId ?? this.userId,
//         userName: userName ?? this.userName,
//         userEmail: userEmail ?? this.userEmail,
//         userPassword: userPassword ?? this.userPassword,
//         userCommercialNum: userCommercialNum ?? this.userCommercialNum,
//         userTaxNum: userTaxNum ?? this.userTaxNum,
//         approved: approved ?? this.approved,
//         accountCreatedAt: accountCreatedAt ?? this.accountCreatedAt,
//         userPumpsNum: userPumpsNum ?? this.userPumpsNum,
//         startFreeTrail: startFreeTrail,
//         endFreeTrail: endFreeTrail,
//       );

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//       userId: json["user_id"],
//       userName: json["user_name"],
//       userEmail: json["user_email"],
//       userPassword: json["user_password"],
//       userCommercialNum: json["user_commercial_num"],
//       userTaxNum: int.parse(json["user_tax_num"]),
//       approved: int.parse(json["approved"]) < UserApproved.values.length
//           ? UserApproved.values[int.parse(json["approved"])]
//           : UserApproved.freeTrial,
//       accountCreatedAt: DateTime.parse(json["account_created_at"]),
//       userPumpsNum: int.parse(json["user_pumps_num"]),
//       startFreeTrail: DateTime.parse(json["start_free_trail"]),
//       endFreeTrail: DateTime.parse(json["end_free_trail"]));

//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "user_name": userName,
//         "user_email": userEmail,
//         "user_password": userPassword,
//         "user_commercial_num": userCommercialNum,
//         "user_tax_num": userTaxNum,
//         "approved": approved.index,
//         "account_created_at": accountCreatedAt.toIso8601String(),
//         "user_pumps_num": userPumpsNum,
//         "start_free_trail": startFreeTrail.toIso8601String(),
//         "end_free_trail": endFreeTrail.toIso8601String()
//       };
// }
