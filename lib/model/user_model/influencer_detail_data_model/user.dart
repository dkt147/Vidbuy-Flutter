import 'package:collection/collection.dart';

import 'influencer_category.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  dynamic countryId;
  dynamic countryName;
  int? roleId;
  String? status;
  String? image;
  dynamic video;
  dynamic avgRating;
  int? reviewCount;
  int? isProfileCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<InfluencerCategory>? influencerCategories;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.countryId,
    this.countryName,
    this.roleId,
    this.status,
    this.image,
    this.video,
    this.avgRating,
    this.reviewCount,
    this.isProfileCompleted,
    this.createdAt,
    this.updatedAt,
    this.influencerCategories,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        countryId: json['country_id'] as dynamic,
        countryName: json['country_name'] as dynamic,
        roleId: json['role_id'] as int?,
        status: json['status'] as String?,
        image: json['image'] as String?,
        video: json['video'] as dynamic,
        avgRating: json['avg_rating'] as dynamic,
        reviewCount: json['review_count'] as int?,
        isProfileCompleted: json['is_profile_completed'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        influencerCategories: (json['influencer_categories'] as List<dynamic>?)
            ?.map((e) => InfluencerCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'country_id': countryId,
        'country_name': countryName,
        'role_id': roleId,
        'status': status,
        'image': image,
        'video': video,
        'avg_rating': avgRating,
        'review_count': reviewCount,
        'is_profile_completed': isProfileCompleted,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'influencer_categories':
            influencerCategories?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      countryId.hashCode ^
      countryName.hashCode ^
      roleId.hashCode ^
      status.hashCode ^
      image.hashCode ^
      video.hashCode ^
      avgRating.hashCode ^
      reviewCount.hashCode ^
      isProfileCompleted.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      influencerCategories.hashCode;
}
