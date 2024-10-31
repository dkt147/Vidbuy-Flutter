import 'package:collection/collection.dart';

import 'influencers_list.dart';

class Result {
  List<InfluencersList>? influencersList;

  Result({this.influencersList});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        influencersList: (json['list'] as List<dynamic>?)
            ?.map((e) => InfluencersList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'list': influencersList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => influencersList.hashCode;
}
