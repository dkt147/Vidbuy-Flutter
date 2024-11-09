import 'package:collection/collection.dart';

import 'waiting_video_list.dart';

class Result {
  WaitingVideoList? waitingVideoList;

  Result({this.waitingVideoList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        waitingVideoList: json['list'] == null
            ? null
            : WaitingVideoList.fromJson(json['list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'list': waitingVideoList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => waitingVideoList.hashCode;
}
