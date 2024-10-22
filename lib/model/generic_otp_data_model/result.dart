import 'package:collection/collection.dart';

import 'user.dart';

class Result {
  UserModel? user;

  Result({this.user});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => user.hashCode;
}
