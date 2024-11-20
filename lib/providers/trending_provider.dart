import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trending_response_model.dart';
import '../services/api_service.dart';

final trendingProvider = FutureProvider<TrendingResponse>((ref) async {
  final apiService = ApiService();
  return await apiService.fetchTrendingScreenings();
});
