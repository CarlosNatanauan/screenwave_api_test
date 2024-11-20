import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/trending_response_model.dart';
import '../models/all_screenings_response_model.dart';

class ApiService {
  final String _baseUrl = "https://screenwave.co.uk/api/v2";

  /// Fetches trending community screenings from the API.
  Future<TrendingResponse> fetchTrendingScreenings() async {
    final url = Uri.parse('$_baseUrl/dev/test/trending?see-all=true');
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      // Parse response data into TrendingResponse model
      final data = json.decode(response.body)['data'];
      return TrendingResponse.fromJson(data);
    } else {
      throw Exception(
          'Failed to fetch trending screenings: ${response.statusCode}');
    }
  }

  /// Fetches all screenings hosted by a specific cinema from the API.
  Future<AllScreeningsResponse> fetchAllScreenings() async {
    final url = Uri.parse('$_baseUrl/dev/test/screening?see-all=true');
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      // Parse response data into AllScreeningsResponse model
      final data = json.decode(response.body);
      return AllScreeningsResponse.fromJson(data);
    } else {
      throw Exception('Failed to fetch all screenings: ${response.statusCode}');
    }
  }
}
