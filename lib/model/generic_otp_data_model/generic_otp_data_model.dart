import 'package:collection/collection.dart';
import 'package:vidbuy_app/model/generic_otp_data_model/user.dart';

import 'result.dart';

class GenericOtpDataModel {
  final bool boolValue;
  final int status;
  final String message;
  final dynamic result; // Either a UserModel or a List

  GenericOtpDataModel({
    required this.boolValue,
    required this.status,
    required this.message,
    this.result,
  });

  factory GenericOtpDataModel.fromJson(Map<String, dynamic> json) {
    return GenericOtpDataModel(
      boolValue: json['bool'],
      status: json['status'],
      message: json['message'],
      result: _parseResult(json['result']),
    );
  }

  static dynamic _parseResult(dynamic result) {
    if (result is List) {
      return result; // Return list as it is
    } else if (result is Map<String, dynamic>) {
      return UserModel.fromJson(result['user']); // Parse user model
    } else {
      return null;
    }
  }
}
