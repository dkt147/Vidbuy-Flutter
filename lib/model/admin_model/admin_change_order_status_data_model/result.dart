import 'package:collection/collection.dart';

import 'influencer_request_video.dart';
import 'video_request.dart';

class Result {
  InfluencerRequestVideo? influencerRequestVideo;
  VideoRequest? videoRequest;

  Result({this.influencerRequestVideo, this.videoRequest});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        influencerRequestVideo: json['influencerRequestVideo'] == null
            ? null
            : InfluencerRequestVideo.fromJson(
                json['influencerRequestVideo'] as Map<String, dynamic>),
        videoRequest: json['videoRequest'] == null
            ? null
            : VideoRequest.fromJson(
                json['videoRequest'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'influencerRequestVideo': influencerRequestVideo?.toJson(),
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
  int get hashCode => influencerRequestVideo.hashCode ^ videoRequest.hashCode;
}
