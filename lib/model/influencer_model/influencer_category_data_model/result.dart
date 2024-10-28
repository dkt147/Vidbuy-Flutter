import 'package:collection/collection.dart';

import 'categorylist.dart';

class Result {
  List<Categorylist>? categorylist;

  Result({this.categorylist});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        categorylist: (json['category_list'] as List<dynamic>?)
            ?.map((e) => Categorylist.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category_list': categorylist?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => categorylist.hashCode;
}
