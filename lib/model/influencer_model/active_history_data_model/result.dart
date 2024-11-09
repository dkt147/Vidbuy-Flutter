import 'package:collection/collection.dart';

import 'request_video.dart';

class Result {
  RequestVideo? requestVideo;

  Result({this.requestVideo});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        requestVideo: json['requestVideo'] == null
            ? null
            : RequestVideo.fromJson(
                json['requestVideo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'requestVideo': requestVideo?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => requestVideo.hashCode;
}
