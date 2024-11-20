// creator_detail_model.dart
class CreatorDetail {
  final String name;
  final String profile;

  CreatorDetail({
    required this.name,
    required this.profile,
  });

  factory CreatorDetail.fromJson(Map<String, dynamic> json) {
    return CreatorDetail(
      name: json['name'],
      profile: json['profile'],
    );
  }
}
