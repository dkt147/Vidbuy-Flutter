import 'package:collection/collection.dart';

import 'requested_video.dart';

class Result {
  RequestedVideo? requestedVideo;
  String? video;

  Result({this.requestedVideo, this.video});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        requestedVideo: json['requested_video'] == null
            ? null
            : RequestedVideo.fromJson(
                json['requested_video'] as Map<String, dynamic>),
        video: json['video'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'requested_video': requestedVideo?.toJson(),
        'video': video,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => requestedVideo.hashCode ^ video.hashCode;
}
