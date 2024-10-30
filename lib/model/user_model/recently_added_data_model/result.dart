import 'package:collection/collection.dart';

import 'pagination.dart';
import 'user.dart';

class Result {
  List<User>? users;
  Pagination? pagination;

  Result({this.users, this.pagination});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'users': users?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => users.hashCode ^ pagination.hashCode;
}
