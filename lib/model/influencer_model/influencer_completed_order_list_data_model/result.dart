import 'package:collection/collection.dart';

import 'completed_list.dart';

class Result {
  CompletedList? completedList;

  Result({this.completedList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        completedList: json['list'] == null
            ? null
            : CompletedList.fromJson(
                json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': completedList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => completedList.hashCode;
}
