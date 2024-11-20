// all_screenings_response_model.dart
import 'all_screening_model.dart';

class AllScreeningsResponse {
  final int totalItems;
  final String heading;
  final List<AllScreening> results;

  AllScreeningsResponse({
    required this.totalItems,
    required this.heading,
    required this.results,
  });

  factory AllScreeningsResponse.fromJson(Map<String, dynamic> json) {
    return AllScreeningsResponse(
      totalItems: json['data']['total_items'],
      heading: json['data']['heading'],
      results: (json['data']['results'] as List)
          .map((item) => AllScreening.fromJson(item))
          .toList(),
    );
  }
}
