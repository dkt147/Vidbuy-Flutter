import 'package:collection/collection.dart';

import 'data.dart';

class AdminRejectedOrdersDataModel {
  bool? success;
  Data? data;

  AdminRejectedOrdersDataModel({this.success, this.data});

  factory AdminRejectedOrdersDataModel.fromJson(Map<String, dynamic> json) {
    return AdminRejectedOrdersDataModel(
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
    if (other is! AdminRejectedOrdersDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode;
}
