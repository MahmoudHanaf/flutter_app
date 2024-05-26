import 'package:flutter_app/core/enums/user_approved_type.dart';

class User {
  String? userId;
  String? username;
  String? password;
  String? phone;
  String? levelId;

  User({
    required this.userId,
    required this.username,
    required this.password,
    required this.phone,
    required this.levelId,
  });
}
