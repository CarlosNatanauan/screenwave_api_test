// trending_response_model.dart
import 'trending_screening_model.dart';

class TrendingResponse {
  final int totalItems;
  final String heading;
  final List<TrendingScreening> results;

  TrendingResponse({
    required this.totalItems,
    required this.heading,
    required this.results,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) {
    return TrendingResponse(
      totalItems: json['total_items'],
      heading: json['heading'],
      results: (json['results'] as List)
          .map((item) => TrendingScreening.fromJson(item))
          .toList(),
    );
  }
}
