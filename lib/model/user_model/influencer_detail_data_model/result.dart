import 'package:collection/collection.dart';

import 'influencer.dart';
import 'user.dart';

class Result {
  User? user;
  List<dynamic>? reviews;
  List<dynamic>? videos;
  List<Influencer>? influencer;

  Result({this.user, this.reviews, this.videos, this.influencer});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        reviews: json['reviews'] as List<dynamic>?,
        videos: json['videos'] as List<dynamic>?,
        influencer: (json['influencer'] as List<dynamic>?)
            ?.map((e) => Influencer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'reviews': reviews,
        'videos': videos,
        'influencer': influencer?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      user.hashCode ^ reviews.hashCode ^ videos.hashCode ^ influencer.hashCode;
}
