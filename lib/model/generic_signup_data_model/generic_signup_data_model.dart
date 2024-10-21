import 'package:vidbuy_app/model/generic_signup_data_model/result.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/user.dart';

// class GenericSignupDataModel {
//   final bool success; // Renamed for clarity
//   final String message;
//   final User? user; // Nullable user field for failed signup
//   final int code;

//   GenericSignupDataModel({
//     required this.success,
//     required this.message,
//     this.user, // Optional user
//     required this.code,
//   });

//   factory GenericSignupDataModel.fromJson(Map<String, dynamic> json) {
//     return GenericSignupDataModel(
//       success: json['bool'] ?? false,
//       message: json['message'] ?? '',
//       user: json['result'] is Map<String, dynamic>
//           ? User.fromJson(json['result']['user'] ?? {})
//           : null, // Handle if result is empty or not as a Map
//       code: json['status'] ?? 0, // Assuming status is an integer code
//     );
//   }
// }

// class GenericSignupDataModel {
//   final bool success;  // Maps to "bool"
//   final int status;    // Maps to "status"
//   final String message; // Maps to "message"
//   final Result? result; // Maps to "result"

//   GenericSignupDataModel({
//     required this.success,
//     required this.status,
//     required this.message,
//      this.result,
//   });

//   factory GenericSignupDataModel.fromJson(Map<String, dynamic> json) {
//     return GenericSignupDataModel(
//       success: json['bool'] ?? false,
//       status: json['status'] ?? 0,
//       message: json['message'] ?? '',
//       result: Result.fromJson(json['result']),
//     );
//   }
// }


class GenericSignupDataModel {
  final bool boolValue; // Renamed to avoid conflict with Dart's 'bool' keyword
  final int status;
  final String message;
  final dynamic result; // Can be a user object or an empty list

  GenericSignupDataModel({
    required this.boolValue,
    required this.status,
    required this.message,
    this.result,
  });

  factory GenericSignupDataModel.fromJson(Map<String, dynamic> json) {
    return GenericSignupDataModel(
      boolValue: json['bool'],
      status: json['status'],
      message: json['message'],
      result: json['result'], // Can be a List or Map, handled in subclasses
    );
  }
}
