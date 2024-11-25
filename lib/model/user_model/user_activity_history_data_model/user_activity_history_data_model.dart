import 'package:collection/collection.dart';

import 'datum.dart';

class UserActivityHistoryDataModel {
  String? message;
  List<Datum>? data;

  UserActivityHistoryDataModel({this.message, this.data});

  factory UserActivityHistoryDataModel.fromJson(Map<String, dynamic> json) {
    return UserActivityHistoryDataModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserActivityHistoryDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
