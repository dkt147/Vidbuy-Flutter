import 'package:collection/collection.dart';

import 'top_user.dart';

class Result {
  List<TopUser>? topUsers;

  Result({this.topUsers});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        topUsers: (json['top_users'] as List<dynamic>?)
            ?.map((e) => TopUser.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'top_users': topUsers?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => topUsers.hashCode;
}
