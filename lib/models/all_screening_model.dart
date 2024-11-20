// all_screening_model.dart
import 'cinema_detail_model.dart';

class AllScreening {
  final String title;
  final String poster;
  final String date;
  final String time;
  final CinemaDetail cinemaDetail;

  AllScreening({
    required this.title,
    required this.poster,
    required this.date,
    required this.time,
    required this.cinemaDetail,
  });

  factory AllScreening.fromJson(Map<String, dynamic> json) {
    return AllScreening(
      title: json['title'],
      poster: json['poster'],
      date: json['date'],
      time: json['time'],
      cinemaDetail: CinemaDetail.fromJson(json['cinema_detail']),
    );
  }
}
