import 'package:collection/collection.dart';

class Result {
  int? id;
  String? priceRange;
  dynamic createdAt;
  dynamic updatedAt;

  Result({this.id, this.priceRange, this.createdAt, this.updatedAt});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        priceRange: json['price_range'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price_range': priceRange,
        'created_at': createdAt,
        'updated_at': updatedAt,
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
      priceRange.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
