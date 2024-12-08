import 'package:collection/collection.dart';

import 'all_order_list.dart';

class Result {
  AllOrderList? allOrderList;

  Result({this.allOrderList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        allOrderList: json['list'] == null
            ? null
            : AllOrderList.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': allOrderList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => allOrderList.hashCode;
}
