// cinema_detail_model.dart
class CinemaDetail {
  final String name;
  final String profile;

  CinemaDetail({
    required this.name,
    required this.profile,
  });

  factory CinemaDetail.fromJson(Map<String, dynamic> json) {
    return CinemaDetail(
      name: json['name'],
      profile: json['profile'],
    );
  }
}
