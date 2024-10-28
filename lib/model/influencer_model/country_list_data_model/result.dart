import 'package:collection/collection.dart';

import 'list.dart';

class Result {
  CountryList? list;

  Result({this.list});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        list: json['list'] == null
            ? null
            : CountryList.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': list?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => list.hashCode;
}
