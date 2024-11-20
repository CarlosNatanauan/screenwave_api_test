import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/all_screenings_response_model.dart';
import '../services/api_service.dart';

final allScreeningsProvider =
    FutureProvider<AllScreeningsResponse>((ref) async {
  final apiService = ApiService();
  return await apiService.fetchAllScreenings();
});
