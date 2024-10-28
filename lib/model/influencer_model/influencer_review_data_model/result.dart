import 'package:collection/collection.dart';

import 'category.dart';
import 'influencer.dart';
import 'user.dart';
import 'video_type.dart';

class Result {
  User? user;
  List<Influencer>? influencer;
  List<Category>? category;
  List<VideoType>? videoTypes;

  Result({this.user, this.influencer, this.category, this.videoTypes});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        influencer: (json['influencer'] as List<dynamic>?)
            ?.map((e) => Influencer.fromJson(e as Map<String, dynamic>))
            .toList(),
        category: (json['category'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        videoTypes: (json['video_types'] as List<dynamic>?)
            ?.map((e) => VideoType.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'influencer': influencer?.map((e) => e.toJson()).toList(),
        'category': category?.map((e) => e.toJson()).toList(),
        'video_types': videoTypes?.map((e) => e.toJson()).toList(),
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
      influencer.hashCode ^
      category.hashCode ^
      videoTypes.hashCode;
}
