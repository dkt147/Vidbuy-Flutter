import 'package:collection/collection.dart';

import 'pending_list.dart';

class Result {
  PendingList? pendingList;

  Result({this.pendingList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pendingList: json['list'] == null
            ? null
            : PendingList.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': pendingList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => pendingList.hashCode;
}
