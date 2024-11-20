// trending_screening_model.dart
import 'screening_detail_model.dart';
import 'creator_detail_model.dart';

class TrendingScreening {
  final String title;
  final String poster;
  final String cinema;
  final String date;
  final String time;
  final ScreeningDetail screeningDetail;
  final CreatorDetail creatorDetail;
  final String? notes;

  TrendingScreening({
    required this.title,
    required this.poster,
    required this.cinema,
    required this.date,
    required this.time,
    required this.screeningDetail,
    required this.creatorDetail,
    this.notes,
  });

  factory TrendingScreening.fromJson(Map<String, dynamic> json) {
    return TrendingScreening(
      title: json['title'],
      poster: json['poster'],
      cinema: json['cinema'],
      date: json['date'],
      time: json['time'],
      screeningDetail: ScreeningDetail.fromJson(json['screening_detail']),
      creatorDetail: CreatorDetail.fromJson(json['creator_detail']),
      notes: json['notes'],
    );
  }
}
