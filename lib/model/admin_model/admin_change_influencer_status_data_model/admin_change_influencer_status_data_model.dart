import 'package:collection/collection.dart';

import 'result.dart';

class AdminChangeInfluencerStatusDataModel {
  bool? Isbool;
  dynamic result;
  String? message;

  AdminChangeInfluencerStatusDataModel({
    this.Isbool,
    this.result,
    this.message,
  });

  factory AdminChangeInfluencerStatusDataModel.fromJson(
      Map<String, dynamic> json) {
    return AdminChangeInfluencerStatusDataModel(
      Isbool: json['bool'] as bool?,
      result: json['result'],
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bool': bool,
        'result': result?.toJson(),
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AdminChangeInfluencerStatusDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => Isbool.hashCode ^ result.hashCode ^ message.hashCode;
}
