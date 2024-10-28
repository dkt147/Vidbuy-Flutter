import 'package:collection/collection.dart';

import 'result.dart';

class LoginDataModel {
  final bool boolValue; // Renamed to avoid conflict with Dart's 'bool' keyword
  final int status;
  final String message;
  final dynamic result; // Can be a user object or an empty list

  LoginDataModel({
    required this.boolValue,
    required this.status,
    required this.message,
    this.result,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      boolValue: json['bool'],
      status: json['status'],
      message: json['message'],
      result: json['result'], // Can be a List or Map, handled in subclasses
    );
  }
}
// class LoginDataModel {
//   bool? boool;
//   int? status;
//   String? message;
//   Result? result;

//   LoginDataModel({this.boool, this.status, this.message, this.result});

//   factory LoginDataModel.fromJson(Map<String, dynamic> json) {
//     return LoginDataModel(
//       boool: json['bool'] as bool?,
//       status: json['status'] as int?,
//       message: json['message'] as String?,
//       result: json['result'] == null
//           ? null
//           : Result.fromJson(json['result'] as Map<String, dynamic>),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'bool': boool,
//         'status': status,
//         'message': message,
//         'result': result?.toJson(),
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! LoginDataModel) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       boool.hashCode ^ status.hashCode ^ message.hashCode ^ result.hashCode;
// }
