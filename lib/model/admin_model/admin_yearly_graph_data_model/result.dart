import 'package:collection/collection.dart';

class Result {
  int? year;
  String? month;
  int? totalViews;

  Result({this.year, this.month, this.totalViews});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        year: json['year'] as int?,
        month: json['month'] as String?,
        totalViews: json['total_views'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'total_views': totalViews,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ totalViews.hashCode;
}
