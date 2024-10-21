// import 'package:collection/collection.dart';

// import 'user.dart';

// class Result {
//   User? user;
//   int? code;

//   Result({this.user, this.code});

//   factory Result.fromJson(Map<String, dynamic> json) {
//     return Result(
//       user: User.fromJson(json['user']),
//       code: json['code'] ?? 0,
//     );

//   }
//   }
import 'package:vidbuy_app/model/generic_signup_data_model/user.dart';

class Result {
  final User user;
  final int code;

  Result({required this.user, required this.code});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      user: User.fromJson(json['user']),
      code: json['code'],
    );
  }
}
