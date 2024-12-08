import 'package:collection/collection.dart';

class Result {
  int? year;
  String? month;
  int? week;
  int? day;
  String? weekday;
  int? totalViews;

  Result({
    this.year,
    this.month,
    this.week,
    this.day,
    this.weekday,
    this.totalViews,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        year: json['year'] as int?,
        month: json['month'] as String?,
        week: json['week'] as int?,
        day: json['day'] as int?,
        weekday: json['weekday'] as String?,
        totalViews: json['total_views'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'week': week,
        'day': day,
        'weekday': weekday,
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
  int get hashCode =>
      year.hashCode ^
      month.hashCode ^
      week.hashCode ^
      day.hashCode ^
      weekday.hashCode ^
      totalViews.hashCode;
}
