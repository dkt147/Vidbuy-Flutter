import 'package:collection/collection.dart';

import 'orders.dart';

class Result {
  Orders? orders;

  Result({this.orders});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        orders: json['list'] == null
            ? null
            : Orders.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': orders?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => orders.hashCode;
}
