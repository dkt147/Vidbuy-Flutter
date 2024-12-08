import 'package:collection/collection.dart';

class Result {
  int? totalInfluencer;

  Result({this.totalInfluencer});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalInfluencer: json['total_influencer'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total_influencer': totalInfluencer,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => totalInfluencer.hashCode;
}
