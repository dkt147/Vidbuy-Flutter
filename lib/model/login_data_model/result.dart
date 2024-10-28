import 'package:collection/collection.dart';

import 'user.dart';

class Result {
  User? user;
  String? token;

  Result({this.user, this.token});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token!,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
