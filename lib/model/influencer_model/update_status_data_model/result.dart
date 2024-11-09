import 'package:collection/collection.dart';

import 'video_request.dart';

class Result {
  VideoRequest? videoRequest;

  Result({this.videoRequest});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        videoRequest: json['videoRequest'] == null
            ? null
            : VideoRequest.fromJson(
                json['videoRequest'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'videoRequest': videoRequest?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => videoRequest.hashCode;
}
