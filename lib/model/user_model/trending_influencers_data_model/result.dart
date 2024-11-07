import 'package:collection/collection.dart';

import 'influencer_category.dart';

class Result {
  int? id;
  int? roleId;
  String? name;
  String? username;
  int? countryId;
  String? countryName;
  String? email;
  String? image;
  String? video;
  dynamic priceRange;
  String? status;
  List<InfluencerCategory>? influencerCategory;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.roleId,
    this.name,
    this.username,
    this.countryId,
    this.countryName,
    this.email,
    this.image,
    this.video,
    this.priceRange,
    this.status,
    this.influencerCategory,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        roleId: json['role_id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        countryId: json['country_id'] as int?,
        countryName: json['country_name'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        video: json['video'] as String?,
        priceRange: json['price_range'] as dynamic,
        status: json['status'] as String?,
        influencerCategory: (json['influencer_category'] as List<dynamic>?)
            ?.map((e) => InfluencerCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role_id': roleId,
        'name': name,
        'username': username,
        'country_id': countryId,
        'country_name': countryName,
        'email': email,
        'image': image,
        'video': video,
        'price_range': priceRange,
        'status': status,
        'influencer_category':
            influencerCategory?.map((e) => e.toJson()).toList(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
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
      id.hashCode ^
      roleId.hashCode ^
      name.hashCode ^
      username.hashCode ^
      countryId.hashCode ^
      countryName.hashCode ^
      email.hashCode ^
      image.hashCode ^
      video.hashCode ^
      priceRange.hashCode ^
      status.hashCode ^
      influencerCategory.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
