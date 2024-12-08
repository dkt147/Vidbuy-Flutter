import 'package:collection/collection.dart';

import 'influencer.dart';
import 'review.dart';
import 'user.dart';
import 'video.dart';

class Result {
  User? user;
  List<Review>? reviews;
  List<Video>? videos;
  List<Influencer>? influencer;
  int? totalReviews;
  int? totalRequest;
  String? priceRange;

  Result({
    this.user,
    this.reviews,
    this.videos,
    this.influencer,
    this.totalReviews,
    this.totalRequest,
    this.priceRange,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        videos: (json['videos'] as List<dynamic>?)
            ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
            .toList(),
        influencer: (json['influencer'] as List<dynamic>?)
            ?.map((e) => Influencer.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalReviews: json['total_reviews'] as int?,
        totalRequest: json['total_request'] as int?,
        priceRange: json['price_range'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'reviews': reviews?.map((e) => e.toJson()).toList(),
        'videos': videos?.map((e) => e.toJson()).toList(),
        'influencer': influencer?.map((e) => e.toJson()).toList(),
        'total_reviews': totalReviews,
        'total_request': totalRequest,
        'price_range': priceRange,
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
      user.hashCode ^
      reviews.hashCode ^
      videos.hashCode ^
      influencer.hashCode ^
      totalReviews.hashCode ^
      totalRequest.hashCode ^
      priceRange.hashCode;
}
