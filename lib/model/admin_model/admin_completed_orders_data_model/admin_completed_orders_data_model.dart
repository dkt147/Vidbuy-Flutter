import 'package:collection/collection.dart';

import 'data.dart';

class AdminCompletedOrdersDataModel {
  bool? success;
  Data? data;

  AdminCompletedOrdersDataModel({this.success, this.data});

  factory AdminCompletedOrdersDataModel.fromJson(Map<String, dynamic> json) {
    return AdminCompletedOrdersDataModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AdminCompletedOrdersDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode;
}
