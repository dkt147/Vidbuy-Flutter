import 'package:collection/collection.dart';

import 'country_list.dart';

class Result {
  CountryList? countryList;

  Result({this.countryList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        countryList: json['list'] == null
            ? null
            : CountryList.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': countryList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => countryList.hashCode;
}
